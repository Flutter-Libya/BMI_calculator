import 'package:bmi_calculator/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ReusableCard.dart';
import 'ReusableContainer.dart';
import 'calculator_brain.dart';
import 'constants.dart';

enum Genders {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders sellectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      onPressed: () {
                        setState(() {
                          sellectedGender = Genders.male;
                        });
                      },
                      cardChild: ReusableCard(
                        genderIcon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        genderText: "MALE",
                      ),
                      colour: sellectedGender == Genders.male
                          ? my_active_color
                          : my_inactive_color,
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      onPressed: () {
                        setState(() {
                          sellectedGender = Genders.female;
                        });
                      },
                      cardChild: ReusableCard(
                        genderIcon: Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        genderText: "FEMALE",
                      ),
                      colour: sellectedGender == Genders.female
                          ? my_active_color
                          : my_inactive_color,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableContainer(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "HEIGHT",
                        style: lableStyle,
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(height.toString(), style: nubmerTextStyle),
                        Text(
                          "cm",
                          style: lableStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTickMarkColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x70EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                colour: my_active_color,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: lableStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: nubmerTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundedIconButton(
                                icon: Icons.minimize_sharp,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 1) {
                                      weight--;
                                    }
                                  });
                                },

                              ),
                            ],
                          )
                        ],
                      ),
                      colour: my_active_color,
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      colour: my_active_color,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: lableStyle,
                          ),
                          Text(
                            age.toString(),
                            style: nubmerTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },

                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RoundedIconButton(
                                icon: Icons.minimize,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                Calculator_brain calc =
                    Calculator_brain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result_screen(
                        bmiResult: calc.calculateBMI(),
                        interpretaition: calc.getInterpretaition(),
                        resultText: calc.getResult()),
                  ),
                );
              },
              buttonTitle: "Result",
            ),
          ],
        ));
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonTitle, this.onTap});
  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
        color: bottom_container_color,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 80,
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.onPressed});
  final IconData icon;
  Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
    );
  }
}
