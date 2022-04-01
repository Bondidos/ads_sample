import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
//ca-app-pub-3940256099942544/6300978111
  late BannerAd myBanner;

  @override
  void initState() {
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.mediumRectangle,
      request: AdRequest(),
      listener: BannerAdListener(),
    )..load();
    super.initState();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: AdWidget(ad: myBanner),
              height: myBanner.size.height.toDouble(),
              width: myBanner.size.width.toDouble(),
            ),
            const SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
