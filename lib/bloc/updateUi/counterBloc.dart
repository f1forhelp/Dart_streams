import 'dart:async';

import 'package:dart_streams/bloc/updateUi/counterEvent.dart';
import 'package:dart_streams/streamGenerators.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent counterEvent) {
    if (counterEvent is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    //StreamGenerators.getRandomNumberStream(20).pipe(_inCounter);
    _inCounter.add(_counter);
  }

  void dispose() {
    print("disposed");
    _counterEventController.close();
    _counterStateController.close();
  }
}
