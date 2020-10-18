import 'package:dart_streams/streamGenerators.dart';
import 'package:flutter/material.dart';

class ConsumingStreamWithoutStreamBuilder extends StatefulWidget {
  @override
  _ConsumingStreamWithoutStreamBuilderState createState() =>
      _ConsumingStreamWithoutStreamBuilderState();
}

class _ConsumingStreamWithoutStreamBuilderState
    extends State<ConsumingStreamWithoutStreamBuilder> {
  String data;

  @override
  void initState() {
    StreamGenerators.getRandomNumberStream(20).listen((event) {
      setState(() {
        data = event.toString() ??
            "null"; //setting data to current stream value and calling setState for update
      });
    }).onDone(() {
      //this method is called when the stream finishes yielding values
      setState(() {
        data = "Done Listening";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          data ?? "Null data",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
