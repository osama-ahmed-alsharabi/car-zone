abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccessful extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}
