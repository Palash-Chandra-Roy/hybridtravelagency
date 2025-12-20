import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
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
                text: "View/Edit Profile",
                color: primary,
                fontSize: 12,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Divider(color: greyE8E, thickness: 1),
        SizedBox(height: 15),
        ListView.builder(
          itemCount: Lists.homeDrawerList.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: Lists.homeDrawerList[index]["onTap"],
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
                      child: Lists.homeDrawerList[index]["image"]
                              .contains('png')
                          ? Image.asset(
                              Lists.homeDrawerList[index]["image"],
                              color: primary,
                              height: 24,
                              // color: primary
                            )
                          : SvgPicture.asset(
                              Lists.homeDrawerList[index]["image"],
                              colorFilter:
                                  ColorFilter.mode(primary, BlendMode.srcIn)),
                    ),
                  ),
                  SizedBox(width: 20),
                  CommonTextWidget.PoppinsRegular(
                    text: Lists.homeDrawerList[index]["text"],
                    color: black2E2,
                    fontSize: 18,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
