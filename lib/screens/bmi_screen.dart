// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusuable_card.dart';

import '../components/button_button.dart';
import '../components/round_button.dart';


 enum genderType  {male, female}

class BmiScreen extends StatefulWidget {
   BmiScreen({ Key? key }) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  
   genderType ?gender;
   int height = 180;
   int weight = 60;
   int Age = 20;

// Color MaleCardColor = inactiveCardColor;
// Color FemaleCardColor = inactiveCardColor;

// void updateColor( genderType gender) {
//   if (gender == genderType.male) {
//     if ( MaleCardColor == inactiveCardColor) {
//       MaleCardColor = activeCardColor;
//       FemaleCardColor = inactiveCardColor;
//     }else {
//       MaleCardColor = inactiveCardColor;
//     }
//   }
//   if (gender == genderType.female){
//     if (FemaleCardColor == inactiveCardColor) {
//       FemaleCardColor = activeCardColor;
//       MaleCardColor = inactiveCardColor;
//     } else {
//       FemaleCardColor = activeCardColor;
//     }
//   }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = genderType.male;
                    });
                  },
                  child: ReusableCard(
                    colour: gender == genderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusuableCardContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      gender = genderType.female;
                    });
                  },
                  child: ReusableCard(
                    colour: gender == genderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: ReusuableCardContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kLabelTextStyle1,
                            ),
                            const Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: const Color(0xFFEB1555),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 10.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 20.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            inactiveColor: const Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kLabelTextStyle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icon: FontAwesomeIcons.minus,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          RoundButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: FontAwesomeIcons.plus,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        Age.toString(),
                        style: kLabelTextStyle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  Age--;
                                });
                              }),
                          const SizedBox(width: 5.0),
                          RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  Age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          BottomButton(
            onTap: () {
              CalculatorBrian cal = CalculatorBrian(height: height, weight: weight);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  )));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
