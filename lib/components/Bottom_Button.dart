import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonBottom extends StatelessWidget {

  ButtonBottom({@required this.texto, @required this.onPressed});


  final Function onPressed;
  final String texto;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
            child: Text(
              texto,
              style: kLargeButtonTextStyle,
            )),
      ),
    );
  }
}