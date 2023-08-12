import 'package:flutter/material.dart';
import '../../../model/onboarding_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';
import '../welcome/welcome_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();
  int selectedIndex=0;
  List<OnBoardingModel> onBoardingList=List.empty(growable: true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData(){
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        onBoardingList.add(OnBoardingModel(Images.onBoard,"Welcome to the bank\nof the future","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text "));
        onBoardingList.add(OnBoardingModel(Images.onBoard,"Welcome to the bank\nof the future","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text "));
        onBoardingList.add(OnBoardingModel(Images.onBoard,"Welcome to the bank\nof the future","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text "));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffD9F3F9),
          body: Column(children: [
            Expanded(child: Container(
              width: AppConstants.itemWidth,
              height: AppConstants.itemHeight-AppConstants.itemHeight*0.02,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppConstants.itemWidth*0.05),bottomRight: Radius.circular(AppConstants.itemWidth*0.05)),
                  image: const DecorationImage(image: AssetImage(Images.onBoard),fit: BoxFit.fill)
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView.builder(
                    itemCount: onBoardingList.length,
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(Images.logo, width: AppConstants.itemHeight*0.2),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                              child: Text(onBoardingList[index].title,
                                style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.055,color: ColorResources.WHITE),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                              child: Text(onBoardingList[index].description,
                                style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04, color: ColorResources.WHITE.withOpacity(0.8)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ]);
                    },
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex=index;
                      });
                    },
                  ),
                  Positioned(
                    bottom: AppConstants.itemHeight*0.02,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _pageIndicators(context),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(height: AppConstants.itemHeight*0.06,),
            GestureDetector(
              onTap: () {
                if(selectedIndex != 2) {
                  _pageController.animateToPage(selectedIndex+1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                }else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorResources.COLOR_PRIMERY,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(AppConstants.itemWidth*0.05),topLeft: Radius.circular(AppConstants.itemWidth*0.05)),

                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical:AppConstants.itemWidth*0.04),
                child: Text("Next",
                    textAlign: TextAlign.center,
                    style: montserratMedium.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  List<Widget> _pageIndicators(BuildContext context) {
    List<Container> indicators = [];
    for (int i = 0; i < onBoardingList.length; i++) {
      indicators.add(
        Container(
          width: i == selectedIndex ?25.0:10.0,
          height: 10,
          margin: const EdgeInsets.only(right: 5,left: 5),
          decoration: BoxDecoration(
            color: i == selectedIndex ? ColorResources.COLOR_PRIMERY : ColorResources.WHITE.withOpacity(0.5),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      );
    }
    return indicators;
  }
}