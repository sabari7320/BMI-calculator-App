import 'package:bmi/screen/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi/constants.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusablecard.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/roundicon_button.dart';
import 'package:bmi/calculator_brain.dart';
enum Gender{
  male,
  female
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

     late Gender selectedGender=Gender.male;
     int height=180;
     int weight=60;
     int age=20;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    colour: selectedGender==Gender.male ?kactiveCardColour :kinactiveColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour: selectedGender==Gender.female ?kactiveCardColour :kinactiveColour,
                    cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',)
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {  },
              colour: kinactiveColour,
              cardChild:Column(
                mainAxisAlignment:MainAxisAlignment.center,

                children: [
                   Text('HEIGHT',style:klabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  children: [
                  Text(height.toString(),style: kNumberTextStyle,),
                  Text('cm',style: klabelTextStyle,)
                ],),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),

                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,

                        onChanged:(double newValue){
                           setState(() {
                             height=newValue.round();

                           });
                    }),
                  )
              ],),

            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {  },
                    colour:kactiveCardColour,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text('WEIGHT',style: klabelTextStyle,),
                         Text(weight.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundIconButton(icon: FontAwesomeIcons.minus,
                           onPressed:(){
                             setState(() {
                               weight--;
                             });
                           },

                           ),
                           SizedBox(width: 10,),
                            RoundIconButton(icon:FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            ),
                          ],
                        ),



                      ],
                    ),

                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){},
                    colour:kactiveCardColour,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE',style: klabelTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPressed:(){
                                  setState(() {
                                    age--;
                                  });
                                },

                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(icon:FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),



                        ],
                    ) ,
                  ),
                ),
              ],
            ),
          ),

           BottomButton(buttonTitle: 'CALCULATE',onTap: (){
             CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);

             Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
               bmiResult:calc.calculateBMI(),
               resultText:calc.getResult() ,
               interpretation:calc.getInterpretation() ,
             ),),);
           },),
        ],
      ),
    );
  }
}








