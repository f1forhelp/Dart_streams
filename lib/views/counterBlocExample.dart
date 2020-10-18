import 'package:dart_streams/bloc/updateUi/counterBloc.dart';
import 'package:dart_streams/bloc/updateUi/counterEvent.dart';
import 'package:dart_streams/widgets/customTextButton.dart';
import 'package:flutter/material.dart';

class CounterBlocExample extends StatefulWidget {
  @override
  _CounterBlocExampleState createState() => _CounterBlocExampleState();
}

class _CounterBlocExampleState extends State<CounterBlocExample> {
  final _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: StreamBuilder<int>(
          initialData: 0,
          stream: _bloc.counter,
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  snapshot.data.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTextButton(
                      onTap: () {
                        _bloc.counterEventSink.add(DecrementEvent());
                      },
                      title: "Decrement",
                    ),
                    CustomTextButton(
                      onTap: () {
                        _bloc.counterEventSink.add(IncrementEvent());
                      },
                      title: "Increment",
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
