import 'package:flutter/material.dart';

import '../streamGenerators.dart';

class StreamBuilderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: StreamGenerators.getRandomNumberStream(
            20), //getting streams of numbers from the StreamGenerator class
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                snapshot.connectionState
                    .toString(), //Out putting current connection state.
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              _showStreamData(
                  snapshot), //method to display data based on if snapshot has data or not
            ],
          );
        },
      ),
    );
  }

  _showStreamData(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return Center(
        child: Text(
          snapshot.data.toString(),
          style: TextStyle(fontSize: 40),
        ),
      );
    } else {
      return Center(
        child: Text(
          "No data",
          style: TextStyle(fontSize: 40),
        ),
      );
    }
  }
}
