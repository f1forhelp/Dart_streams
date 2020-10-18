import 'package:flutter/material.dart';

import '../../streamGenerators.dart';

class StreamWhere extends StatefulWidget {
  @override
  _StreamWhereState createState() => _StreamWhereState();
}

class _StreamWhereState extends State<StreamWhere> {
  String data;

  @override
  void initState() {
    StreamGenerators.getRandomNumberStream(20)
        .where((event) =>
            event % 2 !=
            0) //Conditional statement for selecting paritcular output
        .map((event) =>
            "$event : filtering stream by eleminating element which are  divisible of 2 ")
        .listen((event) {
      data = event;
      setState(() {});
    }); //mapping the stream for a better visualized output

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            data ?? "waiting for response ......",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
