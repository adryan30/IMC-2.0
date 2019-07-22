import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:imc_improved/utils/utils.dart';
import 'package:imc_improved/pages/results.dart';
import 'package:imc_improved/components/icon_buttons.dart';
import 'package:imc_improved/components/icon_card.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool selecaoHomem = false;
  bool selecaoMulher = false;
  double valueSlider = 167.5;
  int weight = 60;
  int age = 16;
  double imc = 0;
  String rank;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CALCULADORA DE IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconCardWithTap(
                  onTapFunction: () {
                    setState(
                      () {
                        if (selecaoHomem == false) {
                          selecaoHomem = true;
                          selecaoMulher = false;
                        } else {
                          selecaoHomem = false;
                        }
                      },
                    );
                  },
                  title: "HOMEM",
                  icon: MdiIcons.genderMale,
                  status: selecaoHomem,
                ),
                IconCardWithTap(
                  onTapFunction: () {
                    setState(
                      () {
                        if (selecaoMulher == false) {
                          selecaoMulher = true;
                          selecaoHomem = false;
                        } else {
                          selecaoMulher = false;
                        }
                      },
                    );
                  },
                  title: "MULHER",
                  icon: MdiIcons.genderFemale,
                  status: selecaoMulher,
                ),
              ],
            ),
            Card(
              child: Container(
                height: 160,
                width: 308,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "ALTURA",
                      style: TextStyle(
                          color: DefaultColors.disabled, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        PlusMinusButton(() {
                          setState(
                            () {
                              valueSlider--;
                            },
                          );
                        }, Icons.remove),
                        RichText(
                          text: TextSpan(
                            text: valueSlider.round().toString(),
                            style: TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: "cm",
                                style: TextStyle(
                                    color: DefaultColors.disabled,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        PlusMinusButton(() {
                          setState(
                            () {
                              valueSlider++;
                            },
                          );
                        }, Icons.add)
                      ],
                    ),
                    Slider(
                      min: 63.0,
                      max: 272.0,
                      value: valueSlider,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            valueSlider = newValue.roundToDouble();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardWithButtons(
                  title: "PESO",
                  data: weight,
                  decreaseFunction: () {
                    setState(() {
                      weight--;
                    });
                  },
                  increaseFunction: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                CardWithButtons(
                  title: "IDADE",
                  data: age,
                  decreaseFunction: () {
                    setState(() {
                      age--;
                    });
                  },
                  increaseFunction: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            imc = calculateIMC();
            rank = calculateRank();
            if (imc > 0 && (selecaoHomem || selecaoMulher)) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Results(
                    imc: imc,
                    result: rank,
                  ),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "CALCULAR SEU IMC",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  double calculateIMC() => imc = weight / (pow((valueSlider / 100), 2));

  String calculateRank() {
    if (imc < 18.5) {
      return "Abaixo";
    } else if (imc <= 24.9) {
      return "Normal";
    } else if (imc <= 29.9) {
      return "Sobrepeso";
    } else if (imc <= 34.9) {
      return "Obeso 1";
    } else if (imc <= 39.9) {
      return "Obeso 2";
    } else {
      return "Obeso 3";
    }
  }
}
