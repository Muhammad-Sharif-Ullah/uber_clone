import 'package:flutter/material.dart';
import 'package:uber_clone/app/BloC/bloc/vanillaCounter/vanilla_counter_bloc.dart';

class VanillaCounterBlocPage extends StatefulWidget {
  const VanillaCounterBlocPage({Key? key}) : super(key: key);

  @override
  State<VanillaCounterBlocPage> createState() => _VanillaCounterBlocPageState();
}

class _VanillaCounterBlocPageState extends State<VanillaCounterBlocPage> {


  final VanillaCounterBloc _bloc = VanillaCounterBloc();



  @override
  void dispose(){
    super.dispose();
    _bloc.disPose();
  }
  @override
  Widget build(BuildContext context) {
    final textTheme1 =
    Theme.of(context).textTheme.headline3?.copyWith(color: Colors.black);
    return Scaffold(
      appBar: AppBar(title: const Text("Vanilla Counter"),),
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

  increment(BuildContext context) => _bloc.counterEvent.add(VanillaCounterIncrement());

  decrement(BuildContext context) => _bloc.counterEvent.add(VanillaCounterDecrement());

  counterTextBListener(BuildContext context, TextStyle? textTheme1) {
    return  StreamBuilder<int>(
      stream: _bloc.counter,
      builder: (context, snapshot) {
        print.call("You have press }");
        return Text(snapshot.data.toString());
      }
    );
  }

  makeZero(BuildContext context) => _bloc.counterEvent.add(VanillaCounterMakeZero());


}
