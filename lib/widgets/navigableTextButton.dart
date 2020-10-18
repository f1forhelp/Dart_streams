import 'package:flutter/material.dart';

class NavigableTextButton extends StatelessWidget {
  final String title;
  final Widget route;

  const NavigableTextButton({Key key, this.title, this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.teal,
      padding: EdgeInsets.all(8),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => route, //Navigates to the given Widget
          ),
        );
      },
      child: Text(
        title, //title for the button
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
