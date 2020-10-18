import 'dart:async';

import 'package:dart_streams/streamGenerators.dart';
import 'package:dart_streams/widgets/customTextButton.dart';
import 'package:flutter/material.dart';

class StreamSubscriptionExample extends StatefulWidget {
  @override
  _StreamSubscriptionExampleState createState() =>
      _StreamSubscriptionExampleState();
}

class _StreamSubscriptionExampleState extends State<StreamSubscriptionExample> {
  //StreamSubscription streamSubscription = StreamSubscription();
  StreamSubscription streamSubscription;
  String data;

  reRunSubscription() {
    streamSubscription =
        StreamGenerators.getRandomNumberStream(20).listen((event) {
      setState(() {
        data = event.toString();
      });
    });
  }

  @override
  void initState() {
    reRunSubscription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data.toString(),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextButton(
            title: "Pause subscription",
            onTap: () {
              streamSubscription.pause();
            },
          ),
          CustomTextButton(
            title: "Resume Subscription",
            onTap: () {
              streamSubscription.resume();
            },
          ),
          CustomTextButton(
            title: "Cancel Subscription",
            onTap: () {
              streamSubscription.cancel();
            },
          ),
          CustomTextButton(
            title: "ReRun Subscription",
            onTap: () async {
              streamSubscription.cancel();
              reRunSubscription();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
