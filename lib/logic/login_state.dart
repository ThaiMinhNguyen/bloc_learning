part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LogOut extends LoginState {}

final class LogIn extends LoginState {}