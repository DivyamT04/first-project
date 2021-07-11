import 'guide_four.dart';
import 'package:flutter/material.dart';

class GuideThree extends StatelessWidget {
  const GuideThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToGuideFour(context);
      },
      child: Image(
        image: AssetImage('assets/images/three.jpeg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
  navigateToGuideFour(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GuideFour())
    );
  }
}
