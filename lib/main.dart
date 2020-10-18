import 'package:dart_streams/views/consumingStreamWithoutStreamBuilder.dart';
import 'package:dart_streams/views/counterBlocExample.dart';
import 'package:dart_streams/views/streamBuilderExample.dart';
import 'package:dart_streams/views/streamFunstions/streamExpand.dart';
import 'package:dart_streams/views/streamFunstions/streamMap.dart';
import 'package:dart_streams/views/streamFunstions/streamSubscriptionExample.dart';
import 'package:dart_streams/views/streamFunstions/streamTake.dart';
import 'package:dart_streams/views/streamFunstions/streamTransform.dart';
import 'package:dart_streams/views/streamFunstions/streamWhere.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/navigableTextButton.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigableTextButton(
              title: "Stream Builder example",
              route: StreamBuilderExample(),
            ),
            SizedBox(
              height: 10,
            ),
            NavigableTextButton(
              title: "Consuming stream without stream builder",
              route: ConsumingStreamWithoutStreamBuilder(),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Text(
              "Stream Functions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            NavigableTextButton(
              title: "Stream subscription",
              route: StreamSubscriptionExample(),
            ),
            NavigableTextButton(
              title: "Stream transform",
              route: StreamTransformExample(),
            ),
            NavigableTextButton(
              title: "Stream Expand",
              route: StreamExpand(),
            ),
            NavigableTextButton(
              title: "Stream take",
              route: StreamTake(),
            ),
            NavigableTextButton(
              title: "Stream map",
              route: StreamMap(),
            ),
            NavigableTextButton(
              title: "Stream Where",
              route: StreamWhere(),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Text(
              "Stream in context of bloc",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            NavigableTextButton(
              title: "The usual block exmple (conter)   --__--",
              route: CounterBlocExample(),
            ),
          ],
        ),
      ),
    );
  }
}
