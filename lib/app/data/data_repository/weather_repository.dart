import 'package:uber_clone/app/data/data_provider/fake_weather_provider.dart';
import 'package:uber_clone/app/data/model/weather_model.dart';

class WeatherRepository {
  static Future<WeatherModel> getWeather(String cityName) async {
    return await FakeWeatherProvider.fetchWeather(cityName)
        .then((response) => WeatherModel.fromJson(response));
  }

  WeatherRepository._();
}
