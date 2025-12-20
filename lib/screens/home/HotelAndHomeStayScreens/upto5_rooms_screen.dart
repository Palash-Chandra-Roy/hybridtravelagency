import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/hotel_and_homestay_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class UpTo5RoomsScreen extends StatelessWidget {
  UpTo5RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelAndHomeStayController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 35),
          ListView.builder(
            shrinkWrap: true,
            itemCount: Lists.upTo5RoomsList.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 24),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: InkWell(
                onTap: Lists.upTo5RoomsList[index]["onTap"],
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: grey9B9.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: greyE2E),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Row(
                      children: [
                        SvgPicture.asset(Lists.upTo5RoomsList[index]["image"]),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonTextWidget.PoppinsMedium(
                              text: Lists.upTo5RoomsList[index]["text1"],
                              color: grey888,
                              fontSize: 14,
                            ),
                            Row(
                              children: [
                                CommonTextWidget.PoppinsSemiBold(
                                  // text: Lists.upTo5RoomsList[index]["text2"],
                                  text:
                                      index == 0 ? controller.destinationId : index == 1 ? controller.checkInDisplay : index == 2 ? controller.checkOutDisplay : controller.roomsAdultsChilds,
                                  color: black2E2,
                                  fontSize: 15,
                                ),
                                // CommonTextWidget.PoppinsMedium(
                                //   text: '${index==0?controller.destinationText:''}' ,
                                //   color: grey888,
                                //   fontSize: 12,
                                // ),
                              ],
                            ),
                            index == 0
                                ? CommonTextWidget.PoppinsRegular(
                                    text: controller.destinationText,
                                    color: grey888,
                                    fontSize: 12,
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CommonTextWidget.PoppinsMedium(
              text: "Improve Your Search",
              color: grey888,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 70,
            width: Get.width,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemCount: SharedPrefUtil.hotelsTypes!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                    top: 13, bottom: 13, left: 24, right: 12),
                itemBuilder: (context, index) {
                  final item = SharedPrefUtil.hotelsTypes![index];
                  final bool isSelected = controller.selectedIds.contains(item.id);

                  return GestureDetector(
                    onTap: () {
                        if (isSelected) {
                          controller.removeId(item.id!);
                        } else {
                          controller.addId(item.id!);
                        }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isSelected ? Colors.black : Colors.white,
                          border: Border.all(
                            color: isSelected ? Colors.black : greyE2E,
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CommonTextWidget.PoppinsMedium(
                              text: item.name,
                              color: isSelected ? Colors.white : grey5F5,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
