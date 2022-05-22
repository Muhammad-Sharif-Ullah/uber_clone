
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uber_clone/app/routes/route_name.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState(){
    super.initState();
    gotoDifferentRoute();
  }
  gotoDifferentRoute() async{
    await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
    Navigator.pushReplacementNamed(context, RouteName.login);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator())),
    );
  }
}
