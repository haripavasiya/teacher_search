import 'package:flutter/material.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/styles.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: AppConstants.itemWidth*0.08,),
          //App Bar
          Row(
            children: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back,color: ColorResources.WHITE,)),
              Expanded(child: Text("Terms & conditions",textAlign: TextAlign.center,style: montserratRegular.copyWith(fontSize:AppConstants.itemWidth*0.04,color: ColorResources.WHITE))),
              const SizedBox(width: 24,),
            ],
          ),
          const Expanded(
            child: Text("Terms & conditions",
              style: montserratMedium,
            ),
          ),
        ],
      ),
    );
  }
}
