enum AuthStates { sucrss, failure, loading, initial }

class AuthState {
  final String? errMessage;
  final AuthStates authState;
  const AuthState({this.errMessage, this.authState = AuthStates.initial});

  AuthState copyWith({String? errMessage, AuthStates? productsState}) {
    return AuthState(
      errMessage: errMessage ?? this.errMessage,
      authState: productsState ?? authState,
    );
  }
}
