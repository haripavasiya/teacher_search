import 'package:flutter/material.dart';
import 'package:tech_all/utill/styles.dart';
import 'package:tech_all/view/baseview/button/custom_button.dart';
import 'package:tech_all/view/screen/auth/login_screen.dart';
import 'package:tech_all/view/screen/auth/registration_screen.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../dashboard/dashboard_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Scaffold(
        body: Container(
          height: AppConstants.itemHeight,
          width: AppConstants.itemWidth,
          decoration: const BoxDecoration(
              color: ColorResources.WHITE
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(Images.logo,fit: BoxFit.fill,),
              Flexible(child: SizedBox(height: AppConstants.itemWidth*0.5,)),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),)),
                      child: const CustomButton("Log In"),
                  ),
                  SizedBox(height: AppConstants.itemWidth*0.02,),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),)),
                      child: const CustomButton("Sign Up"),
                  ),
                  SizedBox(height: AppConstants.itemWidth*0.02,),
                  GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),)),
                      child: const CustomButtonBorder("Continue as Guest")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
