// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
const kBottomContainerColour = Color(0xFFEB1555);
const kActiveCardColour_gender = Color(0xFF2E847B);
const kButton_click = Color(0xFF216C65);
const kInfoHeaderStyle = TextStyle(
    fontSize: 22, color: kActiveCardColour_gender, fontWeight: FontWeight.bold);

const kInfoContentStyle = TextStyle(color: Colors.white, fontSize: 18);
const kInfoContentStyle2 =
    TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFFE9EAEE),
);

const kNumberTextStyle = TextStyle(
    fontSize: 45.0,
    fontWeight: FontWeight.w900,
    color: kActiveCardColour_gender);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

var popupMenuButton = Padding(
  padding: const EdgeInsets.only(right: 10.0),
  child: PopupMenuButton(
    color: kActiveCardColour_gender,
    tooltip: 'Menu',
    child: const Icon(
      Icons.more_vert,
      size: 28.0,
      color: Colors.white,
    ),
    itemBuilder: (context) => [
      PopupMenuItem(
        child: GestureDetector(
          onTap: () {
            _launchURL("https://www.instagram.com/ghayrat_samiev/");
          },
          child: Row(
            children: const [
              Icon(
                FontAwesomeIcons.instagram,
                //   FontAwesomeIcons.instagram,
                color: Colors.red,
                size: 22.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
                child: Text(
                  "Instagram",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
