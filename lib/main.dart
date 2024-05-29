import 'package:bloc_learning/logic/counter_bloc.dart';
import 'package:bloc_learning/logic/internet_cubit.dart';
import 'package:bloc_learning/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(), connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;
  Connectivity connectivity;

  MyApp({required this.appRouter, required this.connectivity, super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}


