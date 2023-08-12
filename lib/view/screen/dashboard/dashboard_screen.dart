import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../coaching/coaching_screen.dart';
import '../school/school_screen.dart';
import '../teacher/teacher_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int pageIndex=0;
  List<Widget> screen_list=[];

  @override
  void initState() {
    super.initState();
    pageIndex=0;
    screen_list=[
      const SchoolScreen(),
      const CoachingScreen(),
      const TeacherScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: screen_list[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorResources.WHITE,
        selectedItemColor: ColorResources.COLOR_PRIMERY,
        unselectedItemColor: ColorResources.BLACK.withOpacity(0.5),
        showUnselectedLabels: true,
        currentIndex: pageIndex,
        elevation: 10,
        selectedLabelStyle: montserratMedium.copyWith(color:ColorResources.BLACK,),
        unselectedLabelStyle: montserratRegular.copyWith(color:ColorResources.BLACK.withOpacity(0.5),),
        type: BottomNavigationBarType.fixed,
        items: [
          barItem(Images.ic_school, "School",0),
          barItem(Images.ic_coaching, "Coaching",1),
          barItem(Images.ic_teacher, "Teacher",2),
        ],
        onTap: (value) {
          setState(() {
            pageIndex=value;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          icon, color: index == pageIndex ? ColorResources.COLOR_PRIMERY : ColorResources.BLACK.withOpacity(0.5),
          height: 23, width: 23,
        ),
      ),
      label: label,
    );
  }
}