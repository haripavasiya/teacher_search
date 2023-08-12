import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_all/view/screen/school/details_screen.dart';

import '../../../model/base/school_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {

  List<SchoolModel> schoolList = List.empty(growable: true);
  List<SchoolModel> tempSchoolList = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    schoolList.add(SchoolModel(
        "https://www.yayskool.com/images/school/akshar-jyoti-public-school-dist-lucknow-9956770.jpg",
        "AKSHAR JYOTI HIGHER SECONDARY SCHOOL",
        "AMBATALAVADI CHARRASTTA B,5 GOPALDHAM KATARGAM SURAT",
        "02612485816",
        "yogiskul@gmail.com"));
    schoolList.add(SchoolModel(
        "_imageUrl",
        "ANGLO URDU HIGH SCHOOL",
        "B/H MUNICIPAL CORPORATION BUILDING SODAGARWADA SURAT",
        " 02612426986",
        "auhs2010[at]gmail[dot]com"));
    schoolList.add(SchoolModel(
        "https://apsrishikesh.com/wp-content/uploads/2022/09/WhatsApp-Image-2022-09-02-at-1.49.58-PM-1024x768.jpeg",
        "ANKUR HIGH SCHOOL",
        "190,HIMATNAGAR SOCIETY HIRA BAUG VARACHHA ROAD SURAT",
        "02616535027",
        "ankurvidyavihar[at]gmail[dot]com"));
    schoolList.add(SchoolModel(
        "_imageUrl",
        "ANKUR VIDHYABHAVAN(H.S.)",
        "AMBA TALAVADI KATARGAM, DI-SURAT",
        "02612407561",
        "principalankursurat[at]gmail[dot]com"));
    schoolList.add(SchoolModel(
        "https://lh5.googleusercontent.com/p/AF1QipOs_bBgyBigYMjoRs-Gf0PHccWbf3SXz3EkP7W6=w1080-k-no",
        "ASHADEEP UCCHTAR MADHYAMIK SHALA",
        "OPP. AKAR SPORTS CLUB , NANA VARACHA , SIMADA ROAD, TA-CHORYASI SURAT",
        "02612573039",
        "ashadeepsciencebhavan[at]yahoo[dot]com"));
    schoolList.add(SchoolModel(
        "https://content.jdmagicbox.com/comp/surat/p7/0261px261.x261.170609231648.a6p7/catalogue/ashadeep-vidhyalay-4-utran-surat-gujarati-medium-schools-w5pvx99b5d.jpg?clr=",
        "ASHADEEP VIDHYALAY",
        "DHARMRAJ PARK SOCIETY, SIMADA GAM, SURAT",
        "02612573039",
        "ashadeepvidhyalaytwohs[at]yahoo[dot]com"));
    schoolList.add(SchoolModel(
        "https://images.jdmagicbox.com/comp/surat/y8/0261px261.x261.120402172739.c8y8/catalogue/kaushal-vidhyabhavan-nana-varaccha-surat-schools-3xqj2nk.jpg?clr=",
        "ASPIRE PUBLIC SCHOOL",
        "NR. SHIVDHARA CAMPUS, MOTA VARACHHA, SURAT",
        "02612919901",
        "dynamicudan[at]gmail[dot]com"));
    schoolList.add(SchoolModel(
        "_imageUrl",
        "B.H.KALSARIYA UCHCHATAR MADH. SHALA",
        "VARSHA-2 MATA VADI AT: SURAT DI: SURAT",
        "02612563746",
        "sadbhavanaschool[at]gmail[dot]com"));
    tempSchoolList.addAll(schoolList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          AppConstants.appNAME,
          style: montserratMedium.copyWith(
              color: ColorResources.WHITE,
              fontSize: AppConstants.itemWidth * 0.04),
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorResources.WHITE,
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
                          results = tempSchoolList;
                        } else {
                          results = schoolList.where((artist) => artist.name.toLowerCase().contains(value.toLowerCase())).toList();
                        }
                        schoolList = results;
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
            itemCount: schoolList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SchoolDetailsScreen(),)),
                child: Container(
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
                          imageUrl: schoolList[index].imageUrl,
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
                                schoolList[index].name,
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
                                        text: schoolList[index].address,
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
                                        text: schoolList[index].email,
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
                                        text: schoolList[index].phone_no,
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
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}