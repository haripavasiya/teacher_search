import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tech_all/view/screen/dashboard/dashboard_screen.dart';
import '../../../provider/otp_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String verificationCode = '', otp = "";

  @override
  void initState() {
    super.initState();
    Provider.of<OTPProvider>(context, listen: false).setReStart(context);
    Provider.of<OTPProvider>(context, listen: false).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OTPProvider>(builder: (context, otpProvider, child) {
      return Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: AppConstants.itemWidth * 0.02,
              ),
              Container(
                padding: EdgeInsets.all(AppConstants.itemWidth * 0.1),
                height: AppConstants.itemHeight * 0.3,
                child: Image.asset(
                  Images.logo,
                  fit: BoxFit.fill,
                ),
              ),
              Text("We sent a verification code on\n+91 9876543210",
                  style: montserratRegular.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: AppConstants.itemWidth * 0.04),
                  textAlign: TextAlign.center),
              SizedBox(
                height: AppConstants.itemHeight * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppConstants.itemWidth * 0.04),
                child: PinCodeTextField(
                  length: 4,
                  appContext: context,
                  obscureText: false,
                  showCursor: true,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldHeight: 45,
                    fieldWidth: 45,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(5),
                    selectedColor: Theme.of(context).primaryColor,
                    selectedFillColor: ColorResources.WHITE,
                    inactiveFillColor: ColorResources.BLACK.withOpacity(0.55),
                    inactiveColor: ColorResources.BLACK.withOpacity(0.55),
                    activeColor: ColorResources.BLACK.withOpacity(0.55),
                    activeFillColor: ColorResources.BLACK.withOpacity(0.55),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onChanged: (value) => verificationCode = value,
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              SizedBox(
                height: AppConstants.itemWidth * 0.12,
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),)),
                  child: const CustomButton("Verify")),
              SizedBox(
                height: AppConstants.itemWidth * 0.12,
              ),
              Visibility(
                visible: otpProvider.start == 0 ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                        '00 : ${Provider.of<OTPProvider>(context, listen: false).start} sec',
                        style: montserratMedium.copyWith(
                            color: ColorResources.BLACK,
                            fontWeight: FontWeight.w700,
                            fontSize: Dimensions.FONT_SIZE_14)),
                    SizedBox(
                      width: AppConstants.itemWidth * 0.06,
                    )
                  ],
                ),
              ),
              Visibility(
                visible: otpProvider.start == 0 ? true : false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not received OTP? ',
                        style: montserratMedium.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: Dimensions.FONT_SIZE_14)),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          AppConstants.closeKeyboard();
                          otpProvider.setReStart(context);
                          otpProvider.startTimer(context);
                        });
                      },
                      child: Text('Resend OTP',
                          style: montserratBold.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: Dimensions.FONT_SIZE_14)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}