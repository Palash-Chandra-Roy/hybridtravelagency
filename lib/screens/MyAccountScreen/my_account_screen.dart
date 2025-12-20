import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class MyAccountScreen extends StatelessWidget {
  MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "My Account",
          color: white,
          fontSize: 18,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              ListTile(
                onTap: () {
                  RouteManagement.goToEditProfileScreen();
                },
                leading: Image.asset(myAccountImage, height: 70, width: 70),
                title: CommonTextWidget.PoppinsMedium(
                  text: SharedPrefUtil.user?.name ?? "User",
                  color: black2E2,
                  fontSize: 18,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (SharedPrefUtil.user?.email != null)
                      CommonTextWidget.PoppinsRegular(
                        text: SharedPrefUtil.user!.email!,
                        color: grey717,
                        fontSize: 12,
                      ),
                    SizedBox(height: 4),
                    CommonTextWidget.PoppinsMedium(
                      text: "Edit Profile",
                      color: primary,
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Divider(color: greyE8E, thickness: 1),
              SizedBox(height: 20),
              ListView.builder(
                itemCount: Lists.myAccountList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    onTap: Lists.myAccountList[index]["onTap"],
                    child: Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 4,
                                color: black262.withValues(alpha: 0.25),
                              ),
                            ],
                            color: white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Lists.myAccountList[index]["image"]
                                    .toString()
                                    .contains('png')
                                ? Image.asset(
                                    Lists.myAccountList[index]["image"],
                                    height: 24,
                                    width: 24,
                                    color: primary,
                                  )
                                : SvgPicture.asset(
                                    Lists.myAccountList[index]["image"],
                                    colorFilter: ColorFilter.mode(
                                        primary, BlendMode.srcIn),
                                  ),
                          ),
                        ),
                        SizedBox(width: 20),
                        CommonTextWidget.PoppinsRegular(
                          text: Lists.myAccountList[index]["text"],
                          color: black2E2,
                          fontSize: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
