import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

// ignore: camel_case_types
class Banner_Ad extends StatefulWidget {
  const Banner_Ad({Key? key}) : super(key: key);

  @override
  _Banner_AdState createState() => _Banner_AdState();
}

// ignore: camel_case_types
class _Banner_AdState extends State<Banner_Ad> {
  // COMPLETE: Add _bannerAd
  late BannerAd _bannerAd;

  // COMPLETE: Add _isBannerAdReady

  @override
  void initState() {
    super.initState();

    // COMPLETE: Initialize _bannerAd
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            
          });
        },
        onAdFailedToLoad: (ad, err) {
          // ignore: avoid_print
          //print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();

    // COMPLETE: Load a Rewarded Ad
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AdWidget(
        ad: _bannerAd..load(),
      ),
      width: _bannerAd.size.width.toDouble(),
      height: _bannerAd.size.height.toDouble(),
    );
  }
}
