abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final String successMessage;

  LoginSuccess({required this.successMessage});
}

final class LoginFaulier extends LoginState {
  final String errorMessage;

  LoginFaulier({required this.errorMessage});
}
