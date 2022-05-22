import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uber_clone/app/BloC/bloc/weather/weather_bloc.dart';
import 'package:uber_clone/app/data/model/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final cityName = TextEditingController();
  late Widget showWidget;

  @override
  Widget build(BuildContext context) {
    print.call("Build Method");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Bloc"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(

          builder: (context, state) {
            print.call("Bloc Builder");
            if (state is WeatherInitial) {
              return buildInitialView();
            } else if (state is WeatherLoading) {
             return buildLoader();
            } else if(state is WeatherLoaded){
              return buildWeatherWithData(context, state.weather);
            } else if(state is WeatherError){
              return buildError();
            } return Container();
          },
        ),
      ),
    );
  }

  Center buildError() => const Center(child: Text("Something went wrong"));

  Center buildLoader() => const Center(child: CircularProgressIndicator());

  Column buildWeatherWithData(BuildContext context, WeatherModel weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weather.cityName,
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        Text(
          weather.temperature + "° C",
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        TextField(
          controller: cityName,
          decoration: InputDecoration(
              hintText: "Input City Name",
              suffix: IconButton(
                  onPressed: () {
                    context
                        .read<WeatherBloc>()
                        .add(GetWeather(city: cityName.text.trim()));
                  },
                  icon: const Icon(Icons.search))),
        ),
      ],
    );
  }

  Widget buildInitialView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: cityName,
          decoration: InputDecoration(
              hintText: "Input City Name",
              suffix: IconButton(
                  onPressed: () {
                    context
                        .read<WeatherBloc>()
                        .add(GetWeather(city: cityName.text.trim()));
                  },
                  icon: const Icon(Icons.search))),
        ),
      ],
    );
  }
}
