// ignore_for_file: unnecessary_string_interpolations, duplicate_ignore

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/information.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_Helper.dart';

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
  // ignore: use_key_in_widget_constructors
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
  late InterstitialAd _interstitialAd;
  bool isIntertitialAdsLoad = false;

  intetStitialAdsLoad() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          isIntertitialAdsLoad = true;

          _interstitialAd.fullScreenContentCallback =
              FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
            _interstitialAd.dispose();
            print("object_object onAdDismissedFullScreenContent");
          }, onAdFailedToShowFullScreenContent: (ad, error) {
            print("object_object ${error.toString()}");
          });
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  initState() {
    super.initState();

    intetStitialAdsLoad();
  }

  @override
  void dispose() {
    _interstitialAd.dispose();
    // TODO: implement dispose
    super.dispose();
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
    return WillPopScope(
      onWillPop: () {
        if (isIntertitialAdsLoad) {
          _interstitialAd.show();
          Navigator.pop(context);
        }
        return null!;
      },
      child: Container(
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
              style:
                  TextStyle(wordSpacing: 0.1, letterSpacing: 0.0, fontSize: 15),
            ),
            const SizedBox(height: 10),
            Text(
              widget.bmiResult,
              style: const TextStyle(
                  letterSpacing: 2,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              //"${widget.bmiResult} is ${widget.resultText.toUpperCase()}",
              "${widget.resultText.toUpperCase()}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  // decoration: TextDecoration.underline,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 35,
            ),
            SingleChildScrollView(
              // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  "${widget.interpretation}",
                  style: TextStyle(
                      wordSpacing: 1.75,
                      fontSize: 20.0,
                      letterSpacing: 0.1,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal),
                ),
                onPressed: () {
                  if (isIntertitialAdsLoad) {
                    _interstitialAd.show();
                  }
                  Navigator.pop(context);
                },
                child: const Text("   Close    ",
                    style: TextStyle(fontSize: 23.0, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
