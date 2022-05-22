
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uber_clone/app/data/data_provider/joke_provider.dart';
import 'package:uber_clone/app/data/model/joke_model.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> with HydratedMixin {
  JokesBloc() : super(JokeInitial()) {
    on<JokesEvent>((event, emit) async {
      if (event is FetchJokes) {
        emit(JokesLoading());
        await JokeProvider.fetchJoke()
            .then((joke) => emit(JokesLoaded(joke: joke)))
            .catchError((error) => emit(ErrorToFetch(error: error.toString())));
      }
    });
  }

  @override
  JokesState? fromJson(Map<String, dynamic> json) {
    try{
      final JokeModel joke = JokeModel.fromJson(json);
      return JokesLoaded(joke: joke);
    } catch(e){
      print.call(e);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(JokesState state) {
    if(state is JokesLoaded){
      return state.joke.toJson();
    }
    return null;
  }
}
