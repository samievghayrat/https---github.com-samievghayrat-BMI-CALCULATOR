// ignore_for_file: unnecessary_string_interpolations

import 'dart:io';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/information.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ResultsPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_rounded,
              size: 27.5,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Information()));
            },
          ),
          popupMenuButton
        ],
        backgroundColor: kActiveCardColour_gender,
        title: Builder(builder: (context) {
          return const Text(
            'BMI RESULTS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          );
        }),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.bmiResult,
                  style: kBMITextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Your Result:  ${widget.resultText.toUpperCase()}",
                  style: kResultTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(widget.interpretation,
                    textAlign: TextAlign.center, style: kResultTextStyle),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 25),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal),
                height: 70,
                width: 400,
                child: const Center(
                  child: Text(
                    "RE-CALCULATE",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  void initState() {
    super.initState();
    _createInterstitialAd(); // create ad
  }

  late InterstitialAd myInterstitial;

  _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910', // test ad ids for different platforms
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // if ad fails to load
        onAdFailedToLoad: (LoadAdError error) {
     //     print('Ad exited with error: $error');
        },

        // else
        onAdLoaded: (InterstitialAd ad) {
          setState(
            () {
              this.myInterstitial = ad; // set the ad equal to the current ad
            },
          );
        },
      ),
    );
  }

  _showInterstitialAd() {
    // create callbacks for ad
    myInterstitial.fullScreenContentCallback = FullScreenContentCallback(
      // when dismissed
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        Navigator.pop(context);
        ad.dispose(); // dispose of ad
      },

      // if ad fails to show content
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        Navigator.pop(context);
     //   print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );

    myInterstitial.show();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContext(context),
    );
  }

  dialogContext(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(top: 50, bottom: 16.0, left: 16, right: 16),
      // margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
          color: kActiveCardColour_gender,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(17),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            "Your BMI result is:",
            style: TextStyle(wordSpacing: 0.1, letterSpacing: 0.01),
          ),
          Text(
            widget.bmiResult,
            style: const TextStyle(
                letterSpacing: 2,
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            //"${widget.bmiResult} is ${widget.resultText.toUpperCase()}",
            "${widget.resultText.toUpperCase()}",
            textAlign: TextAlign.center,
            style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(
            height: 35,
          ),
          SingleChildScrollView(
            // ignore: duplicate_ignore
            child: Text(
              // ignore: unnecessary_string_interpolations
              "${widget.interpretation}",
              style: const TextStyle(
                  wordSpacing: 1.75,
                  fontSize: 19.0,
                  letterSpacing: 0.1,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                _showInterstitialAd();
              },
              child: const Text("   Return   ",
                  style: TextStyle(fontSize: 23.0, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
