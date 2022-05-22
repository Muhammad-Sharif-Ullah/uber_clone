import 'dart:math';

class FakeWeatherProvider {
  static Future<dynamic> fetchWeather(String city) async {
    await Future.delayed(Duration(seconds: Random().nextInt(3) + 1));
    return {
      "cityName": city,
      "temperature": (Random().nextInt(100) + 20).toString()
    };
  }

  FakeWeatherProvider._();
}
