import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_all/utill/app_constants.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class SchoolDetailsScreen extends StatefulWidget {
  const SchoolDetailsScreen({super.key});

  @override
  State<SchoolDetailsScreen> createState() => _SchoolDetailsScreenState();
}

class _SchoolDetailsScreenState extends State<SchoolDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Details",
          style: montserratMedium.copyWith(
              color: ColorResources.WHITE,
              fontSize: AppConstants.itemWidth * 0.04),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConstants.itemWidth * 0.03),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(AppConstants.itemWidth * 0.02),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: "https://apsrishikesh.com/wp-content/uploads/2022/09/WhatsApp-Image-2022-09-02-at-1.49.58-PM-1024x768.jpeg",
                    height: AppConstants.itemWidth * 0.5,
                    width: AppConstants.itemWidth * 0.5,
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
              ],
            ),
            SizedBox(
              height: AppConstants.itemWidth * 0.015,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                      "AKSHAR JYOTI HIGHER SECONDARY SCHOOL",
                      style: montserratMedium.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.05),
                    )),
              ],
            ),
            SizedBox(
              height: AppConstants.itemWidth * 0.015,
            ),
            Divider(thickness: 1,),
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
                          text: "AMBATALAVADI CHARRASTTA B,5 GOPALDHAM KATARGAM SURAT",
                          style: montserratRegular.copyWith(
                              color: ColorResources.BLUE,
                              fontSize:
                              AppConstants.itemWidth * 0.035)),
                    ]),
                  ),
                ),
              ],
            ),
            Divider(thickness: 1,),
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
                          text: "yogiskul@gmail.com",
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
            Divider(thickness: 1,),
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
                          text: "02612485816",
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
            Divider(thickness: 1,),
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
                          text: "Website : ",
                          style: montserratMedium.copyWith(
                              color: ColorResources.BLACK,
                              fontSize:
                              AppConstants.itemWidth * 0.035)),
                      TextSpan(
                          text: "ankurvidyavihar.com",
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
            Divider(thickness: 1,),
            SizedBox(
              height: AppConstants.itemWidth * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}
