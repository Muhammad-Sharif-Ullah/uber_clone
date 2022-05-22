import 'package:flutter/material.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme1 =
    Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: counterTextBListener(context, textTheme1),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () => increment(context),
              child: const Icon(Icons.add)),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => makeZero(context),
              child: const Icon(Icons.refresh)),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => decrement(context),
              child: const Icon(Icons.remove)),
        ],
      ),
    );
  }

  increment(BuildContext context) {}
  decrement(BuildContext context) {}
  counterTextBListener(BuildContext context, TextStyle? textTheme1) {
    return const Text("Counter");
  }

  makeZero(BuildContext context) {}
}
