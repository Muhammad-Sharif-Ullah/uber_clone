import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/cubit/counter/counter_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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

  BlocListener<CounterCubit, int> counterTextBListener(
      BuildContext context, TextStyle? textTheme1) {
    return BlocListener<CounterCubit, int>(
      listener: (context, state) {
        if (state == 10) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("You have reached the heights amount")));
        } else if (state <= 0) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Amount could not be negative")));
        }
      },
      child: Text(context.watch<CounterCubit>().state.toString(), style: textTheme1),
    );
  }

  BlocBuilder<CounterCubit, int> counterTextBBuilder(TextStyle? textTheme1) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, state) {
        return Text(state.toString(), style: textTheme1);
      },
    );
  }

  increment(BuildContext context) => context.read<CounterCubit>().increment();

  decrement(BuildContext context) => context.read<CounterCubit>().decrement();

  makeZero(BuildContext context) => context.read<CounterCubit>().makeZero();
}
