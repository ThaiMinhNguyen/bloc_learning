import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc_learning/logic/login_cubit.dart';
import 'package:user_bloc_learning/presentation/screens/login_page.dart';
import 'package:user_bloc_learning/presentation/screens/user_page.dart';

class FirstPage extends StatefulWidget {
  final String title;
  const FirstPage({required this.title, super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if(state is LogIn){
          return UserPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
