import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_all/utill/app_constants.dart';
import 'package:tech_all/utill/styles.dart';

import '../../../model/base/school_model.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';

class CoachingScreen extends StatefulWidget {
  const CoachingScreen({super.key});

  @override
  State<CoachingScreen> createState() => _CoachingScreenState();
}

class _CoachingScreenState extends State<CoachingScreen> {

  List<SchoolModel> coachingList = List.empty(growable: true);
  List<SchoolModel> tempCoachingList = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coachingList.add(SchoolModel(
        "https://www.yayskool.com/images/school/akshar-jyoti-public-school-dist-lucknow-9956770.jpg",
        "Akshar Coaching",
        "AMBATALAVADI CHARRASTTA B,5 GOPALDHAM KATARGAM SURAT",
        "02612485816",
        "akshar@gmail.com"));
    coachingList.add(SchoolModel(
        "_imageUrl",
        "Anglo Coaching",
        "B/H MUNICIPAL CORPORATION BUILDING SODAGARWADA SURAT",
        " 02612426986",
        "anglo@gmail.com"));
    coachingList.add(SchoolModel(
        "https://apsrishikesh.com/wp-content/uploads/2022/09/WhatsApp-Image-2022-09-02-at-1.49.58-PM-1024x768.jpeg",
        "Ankur Coaching",
        "190,HIMATNAGAR SOCIETY HIRA BAUG VARACHHA ROAD SURAT",
        "02616535027",
        "ankur@gmail.com"));
    coachingList.add(SchoolModel(
        "_imageUrl",
        "Ankur Coaching",
        "AMBA TALAVADI KATARGAM, DI-SURAT",
        "02612407561",
        "ankur@gmail.com"));
    coachingList.add(SchoolModel(
        "https://lh5.googleusercontent.com/p/AF1QipOs_bBgyBigYMjoRs-Gf0PHccWbf3SXz3EkP7W6=w1080-k-no",
        "Ashadeep Coaching",
        "OPP. AKAR SPORTS CLUB , NANA VARACHA , SIMADA ROAD, TA-CHORYASI SURAT",
        "02612573039",
        "ashadeep@gmail.com"));
    coachingList.add(SchoolModel(
        "https://content.jdmagicbox.com/comp/surat/p7/0261px261.x261.170609231648.a6p7/catalogue/ashadeep-vidhyalay-4-utran-surat-gujarati-medium-schools-w5pvx99b5d.jpg?clr=",
        "Ashadeep Coaching",
        "DHARMRAJ PARK SOCIETY, SIMADA GAM, SURAT",
        "02612573039",
        "ashadeep@gmail.com"));
    coachingList.add(SchoolModel(
        "https://images.jdmagicbox.com/comp/surat/y8/0261px261.x261.120402172739.c8y8/catalogue/kaushal-vidhyabhavan-nana-varaccha-surat-schools-3xqj2nk.jpg?clr=",
        "Aspire Coaching",
        "NR. SHIVDHARA CAMPUS, MOTA VARACHHA, SURAT",
        "02612919901",
        "aspire@gmail.com"));
    tempCoachingList.addAll(coachingList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(AppConstants.appNAME,style: montserratMedium.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppConstants.itemHeight * 0.01,
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppConstants.itemWidth * 0.01,
                  horizontal: AppConstants.itemWidth * 0.02),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: ColorResources.BLACK.withOpacity(0.4),
                        blurRadius: 1),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: nameController,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: nameFocus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        textInputAction: TextInputAction.next,
                        style: montserratRegular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth * 0.035),
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onChanged: (value) {
                          setState(() {
                            List<SchoolModel> results = [];
                            if (value.isEmpty) {
                              results = tempCoachingList;
                            } else {
                              results = coachingList.where((artist) => artist.name.toLowerCase().contains(value.toLowerCase())).toList();
                            }
                            coachingList = results;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: AppConstants.itemHeight * 0.02,
                              horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: montserratRegular.copyWith(
                              color: Theme.of(context).hintColor,
                              fontSize: AppConstants.itemWidth * 0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      )),
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                ],
              )),
          SizedBox(
            height: AppConstants.itemHeight * 0.01,
          ),
          Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: coachingList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        vertical: AppConstants.itemWidth * 0.01,
                        horizontal: AppConstants.itemWidth * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: AppConstants.itemWidth * 0.01,
                        horizontal: AppConstants.itemWidth * 0.02),
                    decoration: BoxDecoration(
                        color: ColorResources.WHITE,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.4),
                              blurRadius: 1),
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                          BorderRadius.circular(AppConstants.itemWidth * 0.5),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: coachingList[index].imageUrl,
                            height: AppConstants.itemWidth * 0.2,
                            width: AppConstants.itemWidth * 0.2,
                            placeholder: (context, url) => Image.asset(
                              Images.placeholderImages,
                              fit: BoxFit.fill,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              Images.placeholderImages,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: AppConstants.itemHeight * 0.01,
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: AppConstants.itemWidth * 0.015,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                          coachingList[index].name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: montserratMedium.copyWith(
                                              color: ColorResources.BLACK,
                                              fontSize: AppConstants.itemWidth * 0.05),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: AppConstants.itemWidth * 0.015,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "Address : ",
                                              style: montserratMedium.copyWith(
                                                  color: ColorResources.BLACK,
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                          TextSpan(
                                              text: coachingList[index].address,
                                              style: montserratRegular.copyWith(
                                                  color: ColorResources.BLUE,
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppConstants.itemWidth * 0.015,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "Email : ",
                                              style: montserratMedium.copyWith(
                                                  color: ColorResources.BLACK,
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                          TextSpan(
                                              text: coachingList[index].email,
                                              style: montserratRegular.copyWith(
                                                  color: ColorResources.BLACK
                                                      .withOpacity(0.8),
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppConstants.itemWidth * 0.015,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "Phone : ",
                                              style: montserratMedium.copyWith(
                                                  color: ColorResources.BLACK,
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                          TextSpan(
                                              text: coachingList[index].phone_no,
                                              style: montserratRegular.copyWith(
                                                  color: ColorResources.BLACK
                                                      .withOpacity(0.8),
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                        ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
