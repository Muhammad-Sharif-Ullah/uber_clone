import 'dart:convert';

import 'package:uber_clone/app/data/model/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeProvider {
  static const _baseURI = "https://v2.jokeapi.dev/joke/Any";

  static Future<JokeModel> fetchJoke() async {
    print.call("-============");
    final url = Uri.parse(_baseURI);
    return await http
        .get(url)
        .then((response) {
      print.call("-=-----");
      print.call(response.body);
          final JokeModel joke =  JokeModel.fromJson(jsonDecode(response.body));
          print.call(joke.setup);
          return joke;
        })
        .catchError(
      (e) {
        print.call(e);
        return throw Exception(e.toString());
      },
    );
  }

  JokeProvider._();
}
