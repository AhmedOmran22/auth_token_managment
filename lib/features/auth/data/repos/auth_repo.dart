import 'package:auth_token_managment/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/login_requst_model.dart';
import '../models/register_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login(LoginRequestModel model);
  Future<Either<Failure, UserModel>> register(RegisterRequestModel model);
}
