import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/sortandfilter/sort_and_filter_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class SortByScreen extends StatelessWidget {
  SortByScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 40),
        itemCount: Lists.sortList.length,
        itemBuilder: (context, index) {
          final sortItem = Lists.sortList[index];
          final attributes = sortItem["attributes"] as List<String>;
        final type = sortItem["text1"];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Lists.sortList[index]["image"],
                    ),
                    SizedBox(width: 30),
                    CommonTextWidget.PoppinsMedium(
                      text: Lists.sortList[index]["text1"],
                      color: grey717,
                      fontSize: 14,
                    ),
                Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child:
                    GetBuilder<SortAndFilterController>(
                      builder: (controller) {
                        final selectedIndex =
                            controller.getSelectedAttribute(index) ?? 0;

                        return DropdownButton<int>(
                          value: selectedIndex,
                          underline: const SizedBox(),
                          items: List.generate(attributes.length, (i) {
                            return DropdownMenuItem(
                              value: i,
                              child: Text(
                                attributes[i],
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }),
                          onChanged: (val) {
                            if (val != null) {
                              controller.onAttributeChange(index, val,type.toString().toLowerCase());
                            }
                          },
                        );
                      },
                    ))),
                    // Expanded(
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     child: CommonTextWidget.PoppinsRegular(
                    //       text: Lists.sortList[index]["text2"],
                    //       color: grey717,
                    //       fontSize: 14,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Divider(thickness: 1, color: greyDED),
              SizedBox(height: 15),
            ],
          );
        },
      ),
    );
  }
}
