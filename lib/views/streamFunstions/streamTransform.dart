import 'dart:async';
import 'package:dart_streams/streamGenerators.dart';
import 'package:flutter/material.dart';

class StreamTransformExample extends StatefulWidget {
  @override
  _StreamTransformExampleState createState() => _StreamTransformExampleState();
}

class _StreamTransformExampleState extends State<StreamTransformExample> {
  String data1;
  String data2;
  Stream stream1;
  Stream stream2;

  StreamTransformer streamTransformerWithDoubleData =
      StreamTransformer<int, int>.fromHandlers(
    handleData: (int data, EventSink sink) {
      sink.add(data * 2);
    },
    handleError: (Object error, StackTrace stacktrace, EventSink sink) {
      sink.addError('Something went wrong: $error');
    },
    handleDone: (EventSink sink) => sink.close(),
  );

  @override
  void initState() {
    stream2 = StreamGenerators.getRandomNumberStream(20);
    stream2.listen((event) {
      data2 = event.toString();
    });
    stream1 = StreamGenerators.getRandomNumberStream(20);
    stream1.transform(streamTransformerWithDoubleData).listen((event) {
      setState(() {
        data1 = event.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // "",
              data1.toString() +
                  " This is a transformed stream with double value",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              // "",
              data2.toString() + " This is a normal stream ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
