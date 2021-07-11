import 'package:flutter/material.dart';
import 'guide_five.dart';

class GuideFour extends StatelessWidget {
  const GuideFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToGuideFive(context);
      },
      child: Image(
        image: AssetImage('assets/images/four.jpeg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
  navigateToGuideFive(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GuideFive())
    );
  }
}
