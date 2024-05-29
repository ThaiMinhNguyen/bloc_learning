import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LogOut());

  void Authenticated(){
    emit(LogIn());
  }

  void Unauthenticated(){
    emit(LogOut());
  }
}
