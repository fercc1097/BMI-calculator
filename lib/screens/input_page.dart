import 'package:bmi_calculator/screens/results_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/CardGender.dart';
import 'package:bmi_calculator/components/ReusableCard.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Genero {
  hombre,
  mujer,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genero generoSeleccionado;
  int altura = 180;
  int peso = 80;
  int edad = 25;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CALCULADORA IMC'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusabelCard(
                        onPress: () {
                          setState(() {
                            generoSeleccionado = Genero.hombre;
                          });
                        },
                        colour: generoSeleccionado == Genero.hombre
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: CardGender(
                          icono: FontAwesomeIcons.mars,
                          genero: "HOMBRE",
                        )),
                  ),
                  Expanded(
                    child: ReusabelCard(
                        onPress: () {
                          setState(() {
                            generoSeleccionado = Genero.mujer;
                          });
                        },
                        colour: generoSeleccionado == Genero.mujer
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: CardGender(
                          icono: FontAwesomeIcons.venus,
                          genero: "MUJER",
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReusabelCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Altura",
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          altura.toString(),
                          style: kValorEstilo,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x60EB1555)),
                      child: Slider(
                        value: altura.toDouble(),
                        min: 120,
                        max: 220,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            altura = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusabelCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "PESO",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            "$peso",
                            style: kValorEstilo,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    peso--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    peso++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusabelCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "EDAD",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            edad.toString(),
                            style: kValorEstilo,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    edad--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    edad++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            ButtonBottom(
              texto: "CALCULAR",
              onPressed: () {

                CalculatorBrain calc = CalculatorBrain(altura: altura, peso: peso);

                    Navigator.push(
                      context,
                        MaterialPageRoute(
                          builder: (context) => ResultsPage(
                            bmiResult: calc.calcularBMI(),
                            interpretacion: calc.getInerpretation(),
                            resultadoEnTexto: calc.getResult(),
                          ),
                        ),
                    );
              },
            )
          ],
        ),
    );
  }
}


