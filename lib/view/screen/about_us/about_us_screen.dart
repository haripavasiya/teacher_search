import 'package:flutter/material.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/styles.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

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
              Expanded(child: Text("About Us",textAlign: TextAlign.center,style: montserratRegular.copyWith(fontSize:AppConstants.itemWidth*0.04,color: ColorResources.WHITE))),
              const SizedBox(width: 24,),
            ],
          ),
          const Expanded(
            child: Text("About Us",
              style: montserratMedium,
            ),
          ),
        ],
      ),
    );
  }
}
