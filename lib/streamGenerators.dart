import 'dart:async';

class StreamGenerators {
  StreamGenerators._(); //Private constructor toa void object creation

  //Outputs a stream of numbers for the desired upeer limit
  static Stream<int> getRandomNumberStream(int totalCount) async* {
    for (int i = 0; i < totalCount; i++) {
      await Future.delayed(Duration(
          milliseconds: i == 0
              ? 1000
              : 500)); //Its a simple delay for first run it's 1000 ms and then 500 ms
      yield i; //yield is used to output a stream of data directly rather then provideing an end like StreamController
    }
  }
}
