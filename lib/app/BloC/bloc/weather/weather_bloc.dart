import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uber_clone/app/data/data_repository/weather_repository.dart';
import 'package:uber_clone/app/data/model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>  with HydratedMixin{

  @override
  WeatherBloc() : super( WeatherInitial()) {
    on<WeatherEvent>((event, emit) async{
      if(event is GetWeather){
        emit(WeatherLoading());
        final weather = await WeatherRepository.getWeather(event.city);
        emit(WeatherLoaded(weather: weather));
      }
    });
  }

  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    try{
      final weather = WeatherModel.fromJson(json);
      return WeatherLoaded(weather: weather);
    } catch(e){
      print.call(e);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    if(state is WeatherLoaded){
      return state.weather.toJson();
    }
    return null;
  }

}
