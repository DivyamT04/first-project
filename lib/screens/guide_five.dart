import 'package:flutter/material.dart';

import 'guide_six.dart';

class GuideFive extends StatelessWidget {
  const GuideFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToGuideSix(context);
      },
      child: Image(
        image: AssetImage('assets/images/five.jpeg'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
  navigateToGuideSix(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GuideSix())
    );
  }
}
