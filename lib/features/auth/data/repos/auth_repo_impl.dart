import 'package:auth_token_managment/core/constants/constants.dart';
import 'package:auth_token_managment/core/constants/end_points.dart';
import 'package:auth_token_managment/core/errors/exception.dart';
import 'package:auth_token_managment/core/functions/save_user_data.dart';
import 'package:auth_token_managment/core/services/api_service.dart';
import 'package:auth_token_managment/core/services/prefs.dart';
import 'package:auth_token_managment/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/login_requst_model.dart';
import '../models/register_request_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;
  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, UserModel>> login(LoginRequestModel model) async {
    try {
      final result = await apiService.post(EndPoints.login, data: model.toJson());
      final String token = result['token'];
      final String refreshToken = result['refreshToken'];
      Prefs.setString(kRefreshToken, refreshToken);
      Prefs.setString(kToken, token);
      saveUserData(result);
      return Right(UserModel.fromJson(result));
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(RegisterRequestModel model) async {
    try {
      final result = await apiService.post(EndPoints.register, data: model.toJson());
      final String token = result['token'];
      final String refreshToken = result['refreshToken'];
      Prefs.setString(kRefreshToken, refreshToken);
      Prefs.setString(kToken, token);
      saveUserData(result);
      return Right(UserModel.fromJson(result));
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }
}
