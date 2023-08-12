import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_all/utill/styles.dart';

import '../../../model/base/school_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {

  List<SchoolModel> teacherList = List.empty(growable: true);
  List<SchoolModel> tempTeacherList = List.empty(growable: true);
  TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teacherList.add(SchoolModel(
        "https://no1surat.kvs.ac.in/sites/default/files/styles/thumbnail/public/Principal%20Sir.png?itok=VupAsa_e",
        "Mr.Yeshdeep Rohilla",
        "PRINCIPAL",
        "02612485816",
        "yeshdeeprehilla@gmail.com"));
    teacherList.add(SchoolModel(
        "_imageUrl",
        "G.J. CHOUDHARY",
        "VICE PRINCIPAL",
        " 02612426986",
        "gjchoudhary@gmail.com"));
    teacherList.add(SchoolModel(
        "https://no1surat.kvs.ac.in/sites/default/files/styles/thumbnail/public/mangilal.jpg?itok=PU21i_Bm",
        "Mr. MANGILAL",
        "PGT (Comp.Sci.)	",
        "02616535027",
        "mangilal@gmail.com"));
    teacherList.add(SchoolModel(
        "https://no1surat.kvs.ac.in/sites/default/files/styles/thumbnail/public/WhatsApp%20Image%202021-12-24%20at%2011.38.47%20%281%29.jpeg?itok=s5CwcrkD",
        "Mrs. Sunita D. Marker",
        "PGT COMMERCE",
        "02612407561",
        "sunita@gmail.com"));
    teacherList.add(SchoolModel(
        "https://no1surat.kvs.ac.in/sites/default/files/styles/thumbnail/public/WhatsApp%20Image%202021-12-24%20at%2013.19.37.jpeg?itok=vucW2MLq",
        "Mrs. Madhumita Deb",
        "PGT GEOGRAPHY",
        "02612573039",
        "madhumitadeb@gmail.com"));
    teacherList.add(SchoolModel(
        "https://no1surat.kvs.ac.in/sites/default/files/styles/thumbnail/public/vikram%20parmar.JPG?itok=pX2SLDZa",
        "Mr. Vikram Parmar",
        "PRT",
        "02612573039",
        "vikramparmar@gmail.com"));
    tempTeacherList.addAll(teacherList);
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
                              results = tempTeacherList;
                            } else {
                              results = teacherList.where((artist) => artist.name.toLowerCase().contains(value.toLowerCase())).toList();
                            }
                            teacherList = results;
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
                itemCount: teacherList.length,
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
                            imageUrl: teacherList[index].imageUrl,
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
                                          teacherList[index].name,
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
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "Designation : ",
                                              style: montserratMedium.copyWith(
                                                  color: ColorResources.BLACK,
                                                  fontSize:
                                                  AppConstants.itemWidth * 0.035)),
                                          TextSpan(
                                              text: teacherList[index].address,
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
                                              text: teacherList[index].email,
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
                                              text: teacherList[index].phone_no,
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
