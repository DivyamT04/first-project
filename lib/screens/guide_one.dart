import 'package:flutter/material.dart';

import 'guide_two.dart';

class GuideOne extends StatelessWidget {
  const GuideOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToGuideTwo(context);
      },
      child: Image(
        image: AssetImage('assets/images/one.jpeg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
  navigateToGuideTwo(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => GuideTwo()),
    );
  }
}
