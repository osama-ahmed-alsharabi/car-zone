import 'dart:io';

abstract class AddCarState {}

class AddCarInitial extends AddCarState {}

class AddCarImagePicked extends AddCarState {
  final File image;
  AddCarImagePicked(this.image);
}

class AddCarLoading extends AddCarState {}

class AddCarSuccess extends AddCarState {
  final String message;
  AddCarSuccess(this.message);
}

class AddCarFailure extends AddCarState {
  final String error;
  AddCarFailure(this.error);
}
