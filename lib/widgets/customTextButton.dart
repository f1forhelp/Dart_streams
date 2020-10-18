import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final title;
  final Function onTap;

  const CustomTextButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: Colors.teal,
      padding: EdgeInsets.all(8),
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
