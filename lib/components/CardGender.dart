import 'package:flutter/material.dart';
import '../constants.dart';

class CardGender extends StatelessWidget {

  CardGender({@required  this.icono, String this.genero});
  final IconData icono;
  final String genero;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icono,
            size: 80.0,),
          SizedBox(
            height: 15.0,
          ),
          Text(
            genero,
            style:kLabelTextStyle
          )

        ],
      ),
    );
  }
}