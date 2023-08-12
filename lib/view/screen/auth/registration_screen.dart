import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../otp/otp_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String otp='';
  TextEditingController nameController =TextEditingController();
  TextEditingController monoController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController pincodeController =TextEditingController();
  TextEditingController confirmPasswordController =TextEditingController();
  final FocusNode name_Focus = FocusNode();
  final FocusNode email_Focus = FocusNode();
  final FocusNode pincode_Focus = FocusNode();
  final FocusNode mono_Focus = FocusNode();
  final FocusNode password_Focus = FocusNode();
  final FocusNode confirm_password_Focus = FocusNode();

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
              padding: EdgeInsets.only(top: AppConstants.itemHeight*0.02,left: AppConstants.itemHeight*0.01,right: AppConstants.itemHeight*0.01),
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
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    //name
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full Name",
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
                              controller: nameController,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: name_Focus,
                              keyboardType: TextInputType.name,
                              initialValue: null,
                              textInputAction: TextInputAction.next,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                              decoration: InputDecoration(
                                hintText: 'Enter Full Name',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

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
                              controller: monoController,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: mono_Focus,
                              maxLength: 10,
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
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

                    //email
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email Id",
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
                              controller: emailController,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: email_Focus,
                              keyboardType: TextInputType.emailAddress,
                              initialValue: null,
                              textInputAction: TextInputAction.next,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                              decoration: InputDecoration(
                                hintText: 'Enter Email id',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: TextStyle(height: 1.5),
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
                              controller: passwordController,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: password_Focus,
                              keyboardType: TextInputType.text,
                              initialValue: null,
                              textInputAction: TextInputAction.next,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

                    //confirm password
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Confirm Password",
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
                              controller: confirmPasswordController,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: confirm_password_Focus,
                              keyboardType: TextInputType.text,
                              initialValue: null,
                              textInputAction: TextInputAction.next,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                              decoration: InputDecoration(
                                hintText: 'Enter Confirm Password',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

                    //pincode
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Pincode",
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
                              controller: pincodeController,
                              maxLines: 1,
                              textAlign: TextAlign.left,
                              focusNode: pincode_Focus,
                              keyboardType: TextInputType.number,
                              initialValue: null,
                              maxLength: 6,
                              textInputAction: TextInputAction.done,
                              style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                hintText: 'Enter Pincode',
                                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                isDense: true,
                                counterText: '',
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                errorStyle: TextStyle(height: 1.5),
                                border: InputBorder.none,
                              ),
                            )),
                            SizedBox(width: AppConstants.itemWidth*0.03,),
                          ],
                        )
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.02,),

                    //Submit Button
                    GestureDetector(
                        onTap: () {
                          AppConstants.closeKeyboard();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpScreen(),));
                        },
                        child: const CustomButton("Sign Up")),

                    SizedBox(height: AppConstants.itemHeight*0.02,),
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
