import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uber_clone/app/data/theme_manager.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: AppThemeMode.system)) {
    on<ThemeEvent>((event, emit) {
      if (event is ChangeTheme) {
        emit(ThemeState(themeMode: event.themeMode));
      }
    });
  }

  // @override
  // ThemeState? fromJson(Map<String, dynamic> json) {
  //   try {
  //     final AppThemeMode themeMode = json["value"] as AppThemeMode;
  //     print.call("===============================");
  //     print.call(themeMode.name);
  //     return ThemeState(themeMode: themeMode);
  //   } catch (e) {
  //     print.call(e);
  //     return null;
  //   }
  // }
  //
  // @override
  // Map<String, dynamic>? toJson(ThemeState state) {
  //
  //     return {"value" : state.themeMode};
  //
  // }
}
