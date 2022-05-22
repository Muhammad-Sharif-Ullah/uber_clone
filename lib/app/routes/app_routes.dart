import 'package:flutter/material.dart';
import 'package:uber_clone/app/presentation/pages/counter/counter.dart';
import 'package:uber_clone/app/presentation/pages/counterBloc/CounterBlocPage.dart';
import 'package:uber_clone/app/presentation/pages/intro/intro_page.dart';
import 'package:uber_clone/app/presentation/pages/jokes/jokes_page.dart';
import 'package:uber_clone/app/presentation/pages/login/login_page.dart';
import 'package:uber_clone/app/presentation/pages/signup/phone_auth.dart';
import 'package:uber_clone/app/presentation/pages/signup/signup_page.dart';
import 'package:uber_clone/app/presentation/pages/todo/todo.dart';
import 'package:uber_clone/app/presentation/pages/unknown/unknown_page.dart';
import 'package:uber_clone/app/presentation/pages/vanilla_counter/vanilla_counter_page.dart';
import 'package:uber_clone/app/presentation/pages/weather/weather_page.dart';
import 'package:uber_clone/app/routes/route_name.dart';

import '../presentation/pages/home/home_page.dart';

class AppRoute {
  static const initialRoute = TodoPage();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.root:
        return MaterialPageRoute(
            builder: (context) => initialRoute, settings: settings);
      case RouteName.intro:
        return MaterialPageRoute(
            builder: (context) => const IntroPage(), settings: settings);
      case RouteName.home:
        return MaterialPageRoute(
            builder: (context) => const HomePage(), settings: settings);
      case RouteName.login:
        return MaterialPageRoute(
            builder: (context) => const LoginPage(), settings: settings);
      case RouteName.signup:
        return MaterialPageRoute(
            builder: (context) => const SignUpPage(), settings: settings);
      case RouteName.counter:
        return MaterialPageRoute(
            builder: (context) => const CounterPage(), settings: settings);
      case RouteName.counterBloc:
        return MaterialPageRoute(
            builder: (context) => const CounterBlocPage(), settings: settings);
      case RouteName.weather:
        return MaterialPageRoute(
            builder: (context) => const WeatherPage(), settings: settings);
      case RouteName.vanillaCounter:
        return MaterialPageRoute(
            builder: (context) => const VanillaCounterBlocPage(),
            settings: settings);
      case RouteName.todo:
        return MaterialPageRoute(
            builder: (context) => const TodoPage(), settings: settings);
      case RouteName.phoneAuth:
        return MaterialPageRoute(
            builder: (context) => const PhoneAuthPage(), settings: settings);
      case RouteName.jokes:
        return MaterialPageRoute(
            builder: (context) => const JokesPage(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const UnknownPage(), settings: settings);
    }
  }

  AppRoute._();
}
