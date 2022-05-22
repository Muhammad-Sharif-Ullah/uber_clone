import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/jokes/jokes_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/phone_auth/phone_auth_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/theme/theme_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/todo/todo_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/weather/weather_bloc.dart';
import 'package:uber_clone/app/BloC/cubit/counter/counter_cubit.dart';
import 'package:uber_clone/app/config/config.dart';
import 'package:uber_clone/app/data/data_repository/phone_auth_repository.dart';
import 'package:uber_clone/app/data/theme_manager.dart';
import 'package:uber_clone/app/routes/app_routes.dart';

class UberAppDev extends StatelessWidget {
  const UberAppDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherBloc()),
        BlocProvider(create: (context) =>
            PhoneAuthBloc(phoneAuthRepository: PhoneAuthRepository())),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context)=> ThemeBloc()),
        BlocProvider(create: (context)=> JokesBloc()),

      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: AppConfig.isDev,
            onGenerateRoute: AppRoute.generateRoute,
            theme: AppTheme.appTheme[state.themeMode],
          );
        },
      ),
    );
  }
}
