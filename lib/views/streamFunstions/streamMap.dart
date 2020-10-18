import 'package:flutter/material.dart';

import '../../streamGenerators.dart';

class StreamMap extends StatefulWidget {
  @override
  _StreamMapState createState() => _StreamMapState();
}

class _StreamMapState extends State<StreamMap> {
  Stream<dynamic> stream;
  String data;

  @override
  void initState() {
    stream = StreamGenerators.getRandomNumberStream(10)
        .map((event) => "This event --$event-- is mapped");
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
