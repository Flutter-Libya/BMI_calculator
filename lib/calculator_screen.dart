import 'package:bmi_calculator/ReusableContainer.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/inputpage.dart';
import 'package:flutter/material.dart';

class Result_screen extends StatelessWidget {
  Result_screen({
    @required this.bmiResult,
    @required this.interpretaition,
    @required this.resultText,
  });
  String bmiResult;
  String resultText;
  String interpretaition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
              flex: 10,
              child: ReusableContainer(
                colour: my_active_color,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        resultText.toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                      ),
                    ),
                    Center(
                      child: Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      interpretaition.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: "Re-Enter",
          )
        ],
      ),
    );
  }
}
