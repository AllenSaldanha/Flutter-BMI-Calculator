import 'package:flutter/material.dart';
import '../Components/Constants.dart';



class IconContent extends StatelessWidget {
  IconContent({@required this.gender, @required this.genderIcon });

  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kgendertextstyle,
        ),
      ],
    );
  }
}
