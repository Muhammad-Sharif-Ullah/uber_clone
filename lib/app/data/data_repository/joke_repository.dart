import 'package:uber_clone/app/data/model/joke_model.dart';

class JokeRepository {
  static Future<JokeModel> getJoke() async {
    return await JokeRepository.getJoke()
        .then((joke) => joke);
        // .catchError((error) => throw Exception(error));
  }

  JokeRepository._();
}
