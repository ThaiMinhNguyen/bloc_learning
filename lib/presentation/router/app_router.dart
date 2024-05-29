import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_bloc_learning/presentation/screens/first_screen.dart';
import 'package:user_bloc_learning/presentation/screens/login_page.dart';

import '../screens/user_page.dart';

class AppRouter {
  Route? onGenerateRouter(RouteSettings settings) {
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => FirstPage(title: 'First page'));
      case '/user':
        return MaterialPageRoute(builder: (_) => UserPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
    }
  }
}