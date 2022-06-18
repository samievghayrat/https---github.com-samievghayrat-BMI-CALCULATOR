import 'package:bmi_calculator/banner.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/information.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

// ignore: use_key_in_widget_constructors
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kActiveCardColour_gender;

  //late Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  void updateColors(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == kInactiveCardColour) {
        setState(() {
          maleCardColor = kActiveCardColour_gender;
          femaleCardColor = kInactiveCardColour;
        });
      } else {
        setState(() {
          femaleCardColor = kInactiveCardColour;
        });
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColor == kInactiveCardColour) {
        setState(() {
          femaleCardColor = kActiveCardColour_gender;
          maleCardColor = kInactiveCardColour;
        });
      } else {
        setState(() {
          femaleCardColor = kInactiveCardColour;
        });
      }
    }
  }

  // ignore: non_constant_identifier_names
  void update_one_color() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  bottomNavigationBar: const Banner_Ad(),
      extendBody: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
              size: 27.5,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation,
                      Widget child) {
                    animation = CurvedAnimation(
                        parent: animation, curve: Curves.easeInOutCubic);
                    return ScaleTransition(
                      scale: animation,
                      alignment: Alignment.topRight,
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secAnimation) {
                    return Information();
                  },
                ),
              );
            },
          ),
          popupMenuButton
        ],
        elevation: 10,
        centerTitle: true,
        backgroundColor: kActiveCardColour_gender,

        //  backgroundColor: Color(0xFF0A0E21),
        //backgroundColor: Colors.transparent,
        //elevation: 0.0,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColors(Gender.male);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 40.0, right: 20, left: 20, top: 20),
                            child: SvgPicture.asset(
                              "assets/gym_boy.svg",
                              fit: BoxFit.fill,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Positioned(
                            bottom: 5,
                            right: 5,
                            left: 60,
                            child: Text(
                              "MALE",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      //  margin: edgeInsets,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 0.5), // changes position of shadow
                          ),
                        ],
                        color: maleCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColors(Gender.female);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(15.0),

                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 40.0, right: 20, left: 20, top: 20),
                            child: SvgPicture.asset(
                              "assets/gym_girl3.svg",
                              fit: BoxFit.fill,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                          const Positioned(
                            bottom: 5,
                            right: 5,
                            left: 60,
                            child: Text(
                              "FEMALE",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      //  margin: edgeInsets,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 0.5), // changes position of shadow
                          ),
                        ],
                        color: femaleCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'WEIGHT:  \n        (kg)  ',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle.copyWith(fontSize: 33),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              elevation: 0.0,
                              child: const Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              constraints: const BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: const CircleBorder(),
                              //   fillColor: Color(0xFF4C4F5E),
                              highlightColor: kButton_click,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                              elevation: 0.0,
                              child: const Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              constraints: const BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: const CircleBorder(),
                              //   fillColor: Color(0xFF4C4F5E),
                              highlightColor: kButton_click,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE:  ',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle.copyWith(fontSize: 37.5),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              elevation: 0.0,
                              child: const Icon(FontAwesomeIcons.minus),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              constraints: const BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: const CircleBorder(),
                              //   fillColor: Color(0xFF4C4F5E),
                              highlightColor: kButton_click,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                              elevation: 0.0,
                              child: const Icon(FontAwesomeIcons.plus),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              constraints: const BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: const CircleBorder(),
                              //   fillColor: Color(0xFF4C4F5E),
                              highlightColor: kButton_click,
                            ),
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'HEIGHT:    ',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //  crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            '    cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Colors.white,
                      activeTrackColor: const Color(0xFF56E6D5),
                      thumbColor: kActiveCardColour_gender,
                      overlayColor: const Color(0xFF6B7675),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 240.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          const SizedBox(
            height: 2.5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 25),
            child: InkWell(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                showDialog(
                  barrierColor: Colors.black87,
                  context: context,
                  builder: (context) => CustomDialog(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                );
                // CalculatorBrain calc =
                //     CalculatorBrain(height: height, weight: weight);
                //
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => ResultsPage(
                //       bmiResult: calc.calculateBMI(),
                //       resultText: calc.getResult(),
                //       interpretation: calc.getInterpretation(),
                //     ),
                //
                //     /*ResultsPage(
                //       bmiResult: calc.calculateBMI(),
                //       resultText: calc.getResult(),
                //       interpretation: calc.getInterpretation(),
                //     ),*/
                //   ),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: 0.5,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 0.5), // changes position of shadow
                      ),
                    ],
                    color: kActiveCardColour_gender),
                height: 70,
                width: 400,
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
          )
        ],
      ),
    );
  }
}
