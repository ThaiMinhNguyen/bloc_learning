import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_bloc_learning/logic/login_cubit.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        child: TextButton(
          child: Text("LogOut"),
          onPressed: () {
            BlocProvider.of<LoginCubit>(context).Unauthenticated();
            print(context.read<LoginCubit>().state);
            // Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ),
    );
  }
}
