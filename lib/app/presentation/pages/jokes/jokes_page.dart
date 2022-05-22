import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/jokes/jokes_bloc.dart';
import 'package:uber_clone/app/data/model/joke_model.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Funny Joke")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: ()=> context.read<JokesBloc>().add(FetchJokes()),
      ),
      body: BlocBuilder<JokesBloc, JokesState>(
        builder: (context, state) {
          if (state is JokesLoading) {
            return buildLoader();
          } else if (state is JokesLoaded) {
            final JokeModel joke = state.joke;
            return buildWithData(height, width, joke, context);
          }
          else if(state is ErrorToFetch){
            return buildError(context, state);
          }
          return Center(child: Text("Let's have some fun", style: Theme.of(context).textTheme.bodySmall,),);
        },
      ),
    );
  }

  Widget buildError(BuildContext context, ErrorToFetch state) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: Text(state.error, style: Theme.of(context).textTheme.bodySmall,)),
  );

  Center buildWithData(double height, double width, JokeModel joke, BuildContext context) {
    return Center(
      child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                child: SizedBox(
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text( joke.setup+ "\n" + joke.delivery  , style: Theme.of(context).textTheme.bodyLarge,),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget buildLoader() {
    return const Center(
      child: SizedBox(
                height: 100,width: 100, child: CircularProgressIndicator()),
    );
  }
}
