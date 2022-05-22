
import 'dart:async';

part 'vanilla_counter_event.dart';
part 'vanilla_counter_state.dart';

class VanillaCounterBloc{
  int _counter = 0;

  /// Creating for `Data` [Stream, StreamController, StreamSink]
  /// Holding stream for Input & Output, it's a pipe
  final StreamController<int> _counterController = StreamController<int>();

  ///Stream Input=> whenever some input in the Sink it will
  ///Reflect to the Output Stream
  StreamSink<int> get _counterSink => _counterController.sink;

  ///Stream Output => Listening the changes by stream
  // Counter Value Come from this
  Stream<int> get counter => _counterController.stream;


  ///[Counter Event StreamController & Sink] => Event Triggering
  final StreamController<VanillaCounterEvent> _counterEventController = StreamController<VanillaCounterEvent>();

  // The Event Comes in from this sink
  Sink<VanillaCounterEvent> get counterEvent => _counterEventController.sink;

  VanillaCounterBloc(){
    // Whenever there is a new event, we want to map this new event
    _counterEventController.stream.listen(_mapEventToState);
  }


  void _mapEventToState(VanillaCounterEvent event) {
    if(event is VanillaCounterIncrement){
      _counter++;
      _counterSink.add(_counter);
    }
    else if(event is VanillaCounterDecrement){
      _counter--;
      _counterSink.add(_counter);
    }
    else {
      _counter = 0;
      _counterSink.add(_counter);
    }
  }

  void disPose(){
    _counterEventController.close();
    _counterController.close();
  }
}