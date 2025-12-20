import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';

import '../../../../../../utils/shared_pref_util.dart';

class FareBreakUpScreen1 extends StatelessWidget {
   FareBreakUpScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redF9E,
      appBar: AppBar(
        backgroundColor: primary,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.close, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Fare Breakup",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 15,left: 24,right: 24,bottom: 30),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: white,
          ),
          child: Column(
            children: [
              ListTile(
                title: CommonTextWidget.PoppinsMedium(
                  text: 'Base Fare',
                  color: black2E2,
                  fontSize: 12,
                ),
                subtitle: CommonTextWidget.PoppinsMedium(
                  text: 'Adult(s) (1 X ${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.baseAmount})',
                  color: black2E2,
                  fontSize: 12,
                ),
                trailing: CommonTextWidget.PoppinsMedium(
                  text: "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.baseAmount}",
                  color: black2E2,
                  fontSize: 12,
                ),
                horizontalTitleGap: -3,
              ),
               Divider(color: greyE8E, thickness: 1),
              ListTile(
                title: CommonTextWidget.PoppinsMedium(
                  text: 'Fee & Surcharges',
                  color: black2E2,
                  fontSize: 12,
                ),
                subtitle: CommonTextWidget.PoppinsMedium(
                  text: 'Total fee & surcharges',
                  color: black2E2,
                  fontSize: 12,
                ),
                trailing: CommonTextWidget.PoppinsMedium(
                  text: "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.taxAmount}",
                  color: black2E2,
                  fontSize: 12,
                ),
                horizontalTitleGap: -3,
              ),
              Divider(color: greyE8E, thickness: 1),
              ListTile(
                title: CommonTextWidget.PoppinsMedium(
                  text: 'Other Services',
                  color: black2E2,
                  fontSize: 12,
                ),
                subtitle: CommonTextWidget.PoppinsMedium(
                  text: 'Total fee & surcharges',
                  color: black2E2,
                  fontSize: 12,
                ),
                trailing: CommonTextWidget.PoppinsMedium(
                  text: "${SharedPrefUtil.user!.currency} ${(double.parse(SharedPrefUtil.flightOffer!.totalAmount??'0') - (double.parse(SharedPrefUtil.flightOffer!.baseAmount??'0') + double.parse(SharedPrefUtil.flightOffer!.taxAmount??'0') )).toStringAsFixed(2)}",
                  color: black2E2,
                  fontSize: 12,
                ),
                horizontalTitleGap: -3,
              ),

              Spacer(),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  border: Border.all(color: greyE8E,width: 1),
                  color: white,
                ),
                child: Padding(
                  padding:  EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget.PoppinsSemiBold(
                        text: "Total Amount",
                        color: black2E2,
                        fontSize: 12,
                      ),
                      CommonTextWidget.PoppinsSemiBold(
                        text: "${SharedPrefUtil.user!.currency} ${SharedPrefUtil.flightOffer!.totalAmount}",
                        color: black2E2,
                        fontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
