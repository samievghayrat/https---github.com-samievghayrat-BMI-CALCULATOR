import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveCardColour,
      appBar: AppBar(
        actions: [popupMenuButton],
        backgroundColor: kActiveCardColour_gender,
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("Information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(
              color: kActiveCardColour_gender,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  " -- What is the Body Mass Index?--",
                  style: kInfoHeaderStyle,
                ),
                const Text(
                  "Body Mass Index (BMI) is an index that uses your height and weight to determine if your weight is healthy. BMI calculation divides the weight of an adult in kilograms by the height in square meters. For instance, a BMI of 18.0 indicates 18.0 kg/m2\n",
                  style: kInfoContentStyle,
                ),
                const Text(
                  "For most people the ideal BMI ranges from 18.5 to 24.9\n",
                  style: kInfoContentStyle,
                ),
                const Text(
                  "If your BMI is:",
                  style: kInfoHeaderStyle,
                  textAlign: TextAlign.center,
                ),
                const Text(
                  " - less than 18.5: UNDERWEIGHT ",
                  style: kInfoContentStyle2,
                ),
                const Text(
                  "You are in the underweight range, for you it is recommended to eat more, eat 5 or 6 smaller meals instead of 2 ir 3 large meals during the day . Look for nutrient rich foods.\n",
                  style: kInfoContentStyle,
                ),
                const Text(
                  " - between 18.5 and 24.9: NORMAL ",
                  style: kInfoContentStyle2,
                ),
                const Text(
                  "You are in the healthy weight range \n ",
                  style: kInfoContentStyle,
                ),
                const Text(
                  " - between 25 and 29.9: OVERWEIGHT",
                  style: kInfoContentStyle2,
                ),
                const Text(
                  "You are recommended losign weight through healthy eating and being more physically active. Kids are teens who are overweight are more likely to develop diabetes and other health issues.\n ",
                  style: kInfoContentStyle,
                ),
                const Text(
                  " - above 30.0 - You are in the obese range.",
                  style: kInfoContentStyle2,
                ),
                const Text(
                  "Obesity is caused by eating too much and moving little. The basic solution for obesity consists of weight loss with dieting and physical exercise. Dieting can result in weight loss in the short term and in the long term, also combining with exercise and counseling provide greater results. ",
                  style: kInfoContentStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
