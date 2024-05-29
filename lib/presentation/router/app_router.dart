import 'package:bloc_learning/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../screens/second_home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomePage(title: 'Page 1', color: Colors.purpleAccent,),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondHomePage(title: 'Page 2', color: Colors.red,),
        );
    }
  }
}