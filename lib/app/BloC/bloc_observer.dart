import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// This class will monitor all [app.config.BloC] instances behavior
class UberGlobalObserver extends BlocObserver {

  /// whenever an event is added to the Bloc this method is triggered.
  // One thing to remember here is you need to always call super.
  // onChange first before performing any operation.
  /// [1] A Change represents the change from one State to another.
  /// [2] A Change consists of the currentState and nextState.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('${bloc.runtimeType} $event');
  }


  ///whenever a new state is emitted a Change occurs,
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }


  ///onTransition is called before a Bloc's state has been updated
  ///A transition occurs when a new event is added and a new state
  /// is emitted from a corresponding EventHandler executed.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('${bloc.runtimeType} $transition');
  }

  ///onError is called whenever an error occurs and notifies
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
