
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: SizedBox(height: 100, width: 100, child: CircularProgressIndicator())),
    );
  }
}
