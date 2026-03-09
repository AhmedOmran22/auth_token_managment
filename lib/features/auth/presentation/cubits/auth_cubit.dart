import 'package:auth_token_managment/features/auth/data/models/register_request_model.dart';
import 'package:auth_token_managment/features/auth/data/repos/auth_repo.dart';
import 'package:auth_token_managment/features/auth/presentation/cubits/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_requst_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(const AuthState());

  final AuthRepo _authRepo;
  void login({required LoginRequestModel loginRequestModel}) async {
    emit(const AuthState(authState: AuthStates.loading));
    final result = await _authRepo.login(loginRequestModel);
    result.fold((failure) {
      emit(AuthState(authState: AuthStates.failure, errMessage: failure.errMessage));
    }, (r) => emit(const AuthState(authState: AuthStates.sucrss)));
  }

  void register({required RegisterRequestModel registerRequestModel}) async {
    emit(const AuthState(authState: AuthStates.loading));
    final result = await _authRepo.register(registerRequestModel);
    result.fold((failure) {
      emit(AuthState(authState: AuthStates.failure, errMessage: failure.errMessage));
    }, (r) => emit(const AuthState(authState: AuthStates.sucrss)));
  }
}
