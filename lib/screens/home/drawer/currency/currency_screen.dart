import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/currencies_response.dart';
import 'package:hybridtravelagency/screens/home/drawer/currency/currency_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class CurrencyScreen extends StatelessWidget {
  final Function(CurrencyData) onCurrencySelected;
  CurrencyScreen({super.key, required this.onCurrencySelected});

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
          text: "Currency",
          color: white,
          fontSize: 18,
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                CommonTextWidget.PoppinsSemiBold(
                  text: "Select Currency",
                  color: black2E2,
                  fontSize: 16,
                ),
                SizedBox(height: 30),
                GetBuilder<CurrencyController>(
                  init: CurrencyController(),
                  builder: (controller) => ListView.builder(
                    itemCount: SharedPrefUtil.currencies!.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var currency = SharedPrefUtil.currencies![index];
                      return Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: currency.text,
                            color: grey717,
                            fontSize: 14,
                          ),
                          InkWell(
                            onTap: () {
                              controller.onIndexChange(index);
                              onCurrencySelected(currency);
                            },
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                                border: Border.all(color: redCA0),
                              ),
                              alignment: Alignment.center,
                              child: controller.selectedIndex == index
                                  ? Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: redCA0,
                                          shape: BoxShape.circle),
                                    )
                                  : SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    );},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
