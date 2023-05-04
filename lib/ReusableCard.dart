import 'package:flutter/material.dart';

import 'constants.dart';



class ReusableCard extends StatelessWidget {
  ReusableCard({this.genderText, this.genderIcon});
  final String genderText;
  final Icon genderIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        genderIcon,
        SizedBox(
          height: 20,
        ),
        Text(
          genderText,
          style: lableStyle,
        ),
      ],
    );
  }
}
