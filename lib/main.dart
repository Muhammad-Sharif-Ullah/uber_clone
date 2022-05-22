import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uber_clone/app/BloC/bloc_observer.dart';
import 'package:uber_clone/app/config/config.dart';
import 'package:uber_clone/dev_app.dart';
import 'package:uber_clone/firebase_options.dart';
import 'package:uber_clone/production_app.dart';

///Initialized all the necessary Dependencies
///Before Run App Call
void appInitialization() async {
  /// Returns an instance of the binding that implements WidgetsBinding.
  // If no binding has yet been initialized, the WidgetsFlutterBinding
  // class is used to create and initialize one
  /// we must first ensure that everything is natively initialised
  WidgetsFlutterBinding.ensureInitialized();

  ///Firebase Initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future<void> main() async {
  appInitialization();

  // used to link our application to the storage.
  // If the storageDirectory parameter is not specified,
  // the data will be stored temporarily in the device by default.
  // So to avoid that we are going to acquire the application
  // directory path using path_provider package.
  /// we need to tell Hydrated Bloc where to save the data.
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  /// Call Flutter Engine
  const Widget app = AppConfig.isDev ? UberAppDev() : UberAppProduction();

  // BlocOverrides.runZoned(
  //   () {
  //     /// To run our app safely after all the overridden processes we need to pass our
  //     // runApp function to the HydratedBlocOverrides.runZoned()
  //     return HydratedBlocOverrides.runZoned(
  //       () => app,
  //       storage: storage,
  //     );
  //   },
  //   blocObserver: UberGlobalObserver(),
  // );

  /// To run our app safely after all the overridden processes we need to pass our
  // runApp function to the HydratedBlocOverrides.runZoned()
  HydratedBlocOverrides.runZoned(
    () => runApp(app),
    storage: storage,
    blocObserver: UberGlobalObserver(),
  );
}
