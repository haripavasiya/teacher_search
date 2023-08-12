import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_all/view/screen/auth/registration_screen.dart';
import 'package:tech_all/view/screen/otp/otp_screen.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String otp='';
  TextEditingController mono_Controller =TextEditingController();
  TextEditingController password_Controller =TextEditingController();
  final FocusNode mono_Focus = FocusNode();
  final FocusNode password_Focus = FocusNode();
  bool isChecked=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    otp=Random().nextInt(9999).toString().padLeft(4, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(AppConstants.itemWidth*0.1),
            height: AppConstants.itemHeight*0.3,child: Image.asset(Images.logo,fit: BoxFit.fill,),),
          Expanded(
            child: Container(
              width: AppConstants.itemWidth,
              padding: EdgeInsets.only(top: AppConstants.itemHeight*0.05,left: AppConstants.itemHeight*0.03,right: AppConstants.itemHeight*0.03),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemHeight*0.04),topRight: Radius.circular(AppConstants.itemHeight*0.04)),
                  boxShadow: [
                    BoxShadow(
                        color: ColorResources.BLACK.withOpacity(0.5),
                        blurRadius: 1
                    )
                  ]
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    //mobile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mobile no",
                            textAlign: TextAlign.start,
                            style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemHeight*0.017)),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                        decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius:BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                            ]
                        ),
                        child:Row(
                          children: [
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                            Expanded(child: TextFormField(
                              controller: mono_Controller,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: mono_Focus,
                              keyboardType: TextInputType.number,
                              initialValue: null,
                              textInputAction: TextInputAction.next,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                hintText: 'Enter Mobile no',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: const TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

                    //password
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Password",
                            textAlign: TextAlign.start,
                            style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemHeight*0.017)),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                        decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius:BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurRadius: 1),
                            ]
                        ),
                        child:Row(
                          children: [
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                            Expanded(child: TextFormField(
                              controller: password_Controller,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: password_Focus,
                              keyboardType: TextInputType.text,
                              initialValue: null,
                              textInputAction: TextInputAction.done,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: const TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.005,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password?",
                            textAlign: TextAlign.end,
                            style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemHeight*0.015)),
                      ],
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child:  RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "By signing you agree to our ",
                                style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK)),

                            TextSpan(
                              text: "Privacy Policy",
                              style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                            ),

                            TextSpan(
                              text: " and ",
                              style: montserratRegular.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.BLACK),),

                            TextSpan(
                              text: "Terms of use",
                              style: montserratMedium.copyWith( fontSize: AppConstants.itemWidth*0.028,color: ColorResources.COLOR_PRIMERY),
                              recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const TermsConditionScreen(),)),
                            ),
                          ]),
                        ),),
                      ],
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

                    //Submit Button
                    GestureDetector(
                        onTap: () {
                          AppConstants.closeKeyboard();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen(),));
                        },
                        child: const CustomButton("Log In")),

                    //Not Account
                    SizedBox(height: AppConstants.itemHeight*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account? ",style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const RegistrationScreen()));
                            },
                            child: Text("Sign Up",style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035, color: ColorResources.BLACK),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
