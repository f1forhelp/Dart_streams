import 'package:flutter/material.dart';

import '../../streamGenerators.dart';

class StreamTake extends StatefulWidget {
  @override
  _StreamTakeState createState() => _StreamTakeState();
}

class _StreamTakeState extends State<StreamTake> {
  Stream<dynamic> stream;
  String data;

  @override
  void initState() {
    stream = StreamGenerators.getRandomNumberStream(10)
        .take(5)
        .map((event) => event.toString() + " .take(5)");
    stream.listen((event) {
      data = event;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(
          data ?? "waiting for response ......",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
