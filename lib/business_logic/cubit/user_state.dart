part of 'user_cubit.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLogin extends UserState {
  User user;
  UserLogin({required this.user});
}

class UserUpdate extends UserState {
  User user;
  UserUpdate({required this.user});
}

class UserLoading extends UserState {}

class UserError extends UserState {
  String error;
  UserError({required this.error});
}
