import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/ReusableCard.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.interpretacion, @required this.resultadoEnTexto});

  final String bmiResult;
  final String resultadoEnTexto;
  final String interpretacion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Tu resultado",
              style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child:ReusabelCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[
                  Text(
                      "$resultadoEnTexto",
                    style: kResultTextStyle,
                  ),
                  Text(
                    "$bmiResult",
                    style: kBMITextStyle,
                  ),
                  Text("$interpretacion",
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ) ,
          ),
          ButtonBottom(
            texto: "RE-CALCULAR",
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
