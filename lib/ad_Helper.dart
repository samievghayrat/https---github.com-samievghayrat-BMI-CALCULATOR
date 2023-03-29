import 'dart:io';

//ignore: file names

class AdHelper {
  //adhelper

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-1661217858596928/6870414152';
    }
    // else if (Platform.isIOS) {
    //   return 'ca-app-pub-3940256099942544/2934735716';
    // }
    else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1661217858596928/2866769121";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
