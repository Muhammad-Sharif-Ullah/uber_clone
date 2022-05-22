// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.cityName,
    required this.temperature,
  });

  String cityName;
  String temperature;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json["cityName"],
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "cityName": cityName,
        "temperature": temperature,
      };
}
