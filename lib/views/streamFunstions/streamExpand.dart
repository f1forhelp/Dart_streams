import 'package:flutter/material.dart';

import '../../streamGenerators.dart';

class StreamExpand extends StatefulWidget {
  @override
  _StreamExpandState createState() => _StreamExpandState();
}

class _StreamExpandState extends State<StreamExpand> {
  Stream<dynamic> stream;
  String data;

  @override
  void initState() {
    stream = StreamGenerators.getRandomNumberStream(10)
        .expand((element) => [" Expanded ", element]);
    stream.listen((event) {
      data = event.toString();

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
