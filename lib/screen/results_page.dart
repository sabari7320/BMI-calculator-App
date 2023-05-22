import 'package:bmi/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/reusablecard.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({super.key, required this.bmiResult,required this.resultText,required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',style: kTitleTextStyle,),
            ),),
          Expanded(

           flex:5 ,
           child:ReusableCard(
             onPress: () {  },
             colour: kactiveCardColour,
             cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                      Text(resultText.toUpperCase(),
                 style:resultTextStyle),
                 Text(bmiResult,style: KBMITextStyle,),
                 Text(interpretation,textAlign:TextAlign.center,style: kBodyTextStyle,),
               ],
             ),
           ) ,
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle:'RE-CALCULATE')
        ],
      ),
    );
  }
}
