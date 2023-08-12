import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../intro/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  bool? isNotConnected=true;

  @override
  void initState() {
    super.initState();
    AppConstants.closeKeyboard();
    route("1");
  }

  route(String isRoute) async {
    Future.delayed(const Duration(seconds: 3)).then((val) {
      if (isRoute=="1") {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const IntroScreen()));
      }
      else {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const IntroScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }

  @override
  Widget build(BuildContext context) {
    AppConstants.screenSize=MediaQuery.of(context).size;
    AppConstants.itemHeight=AppConstants.screenSize.height;
    AppConstants.itemWidth=AppConstants.screenSize.width;
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: Container(
          height: AppConstants.itemHeight,
          width: AppConstants.itemWidth,
          decoration: const BoxDecoration(
              color: ColorResources.WHITE
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(Images.logo,width: AppConstants.itemWidth*0.5,height: AppConstants.itemWidth*0.25,fit: BoxFit.fill,),
              CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,)
            ],
          ),
        ),
      ),
    );
  }
}