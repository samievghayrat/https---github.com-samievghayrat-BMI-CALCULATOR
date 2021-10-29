import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Interstitial extends StatefulWidget {
  const Interstitial({Key? key}) : super(key: key);

  @override
  State<Interstitial> createState() => _InterstitialState();
}

class _InterstitialState extends State<Interstitial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd(); // create ad
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interstatial Ads'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showInterstitialAd(); // show ad
          },
          child: const Text('Go To Second Page'),
        ),
      ),
    );
  }

  // create ad
  _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910', // test ad ids for different platforms
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // if ad fails to load
        onAdFailedToLoad: (LoadAdError error) {
          //  print('Ad exited with error: $error');
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondPage(), // go to next page
          ),
        );
        ad.dispose(); // dispose of ad
      },

      // if ad fails to show content
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondPage(), // go to next page
          ),
        );
        //  print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );

    myInterstitial.show();
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late InterstitialAd myInterstitial;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd(); // create ad
  }

  @override
  Widget build(BuildContext context) {
    return
        /* WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        Navigator.pop(context); // pops page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MyHomePage(), // replace popped page to call init again
          ),
        );
      },
      child:*/
        Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showInterstitialAd(); // show ad
          },
          child: const Text('Go To Third Page'),
        ),
      ),
    );
  }

  // create ad
  _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-3940256099942544/4411468910', // test ad ids for different platforms

      request: const AdRequest(),

      adLoadCallback: InterstitialAdLoadCallback(
        // if ad fails to load
        onAdFailedToLoad: (LoadAdError error) {
          //  print('Ad exited with error: $error'); // print error
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
      // when dismsissed
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        // Navigator.pop(context); // pop page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const ThirdPage(), // replace popped page to call init again
          ),
        );
        ad.dispose(); // dispose ad
      },

      // if ad fails to show
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        // Navigator.pop(context); // pop page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const ThirdPage(), // replace popped page to call init again
          ),
        );
        //  print('$ad onAdFailedToShowFullScreenContent: $error'); // print error
        ad.dispose(); // dispose ad
      },
    );

    myInterstitial.show(); // show ad
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Page"),
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => SecondPage()));
        //     },
        //     icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Third Page"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
