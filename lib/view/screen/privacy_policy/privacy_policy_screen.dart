import 'package:flutter/material.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppConstants.itemWidth,
        height: AppConstants.itemHeight,
        child: Column(
          children: [
            SizedBox(height: AppConstants.itemWidth*0.08,),
            //App Bar
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back,color: ColorResources.WHITE,)),
                Expanded(child: Text("Privacy Policy",textAlign: TextAlign.center,style: montserratRegular.copyWith(fontSize:AppConstants.itemWidth*0.04,color: ColorResources.WHITE))),
                const SizedBox(width: 24,),
              ],
            ),
            const Expanded(
              child: Text("Privacy Policy",
                style: montserratMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
