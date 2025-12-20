import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/navigators/navigators.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/widgets/hotel_card.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotel_detail_screen.dart';
import 'package:hybridtravelagency/screens/home/HotelAndHomeStayScreens/HotelsScreen/hotels_controller.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class HotelsScreen extends StatelessWidget {
  HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HotelsController>(builder: (controller) {
    return Scaffold(
      backgroundColor: redF9E,
      body: Column(
        children: [
          Container(
            height: 155,
            width: Get.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(hotelAndHomeStayTopImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 24, right: 24, top: 60, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        horizontalTitleGap: -5,
                        leading: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child:
                              Icon(Icons.arrow_back, color: grey888, size: 20),
                        ),
                        title: CommonTextWidget.PoppinsMedium(
                          text: controller.destination,
                          color: black2E2,
                          fontSize: 15,
                        ),
                        subtitle: CommonTextWidget.PoppinsRegular(
                          text: "${formatToDayMonth(controller.checkIn)} - ${formatToDayMonth(controller.checkOut)}, ${controller.rooms} Room, ...",
                          color: grey717,
                          fontSize: 12,
                        ),
                        trailing: InkWell(
                          onTap: () {
                            RouteManagement.goToHotelAndHomeStayScreen();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(draw),
                              SizedBox(height: 10),
                              CommonTextWidget.PoppinsMedium(
                                text: "Edit",
                                color: redCA0,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.location_on, color: redCA0),
                              CommonTextWidget.PoppinsMedium(
                                text: "Map",
                                color: redCA0,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: Get.width,
            color: white,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 24, right: 19, top: 1, bottom: 10),
              shrinkWrap: true,
              itemCount: Lists.hotelList1.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: Lists.hotelList1[index]["onTap"],
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                      border: Border.all(color: greyE2E, width: 1),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      child: Row(
                        children: [
                          CommonTextWidget.PoppinsMedium(
                            text: Lists.hotelList1[index]["text"],
                            color: grey717,
                            fontSize: 12,
                          ),
                          SizedBox(width: 7),
                          SvgPicture.asset(arrowDownIcon,
                              colorFilter: ColorFilter.mode(grey717, BlendMode.srcIn)
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: controller.isLoading
                  ? ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return flightsShimmer();
                  })
                  : controller.hotelsList != null
                  // && controller.sortedOffers.isNotEmpty
                  ? ListView.builder(
                itemCount: controller.hotelsList!.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => HotelDetailScreen(hotel: controller.hotelsList![index]));
                    },
                    child: HotelCard(hotel: controller.hotelsList![index]),
                  ),
                ),
              ):SizedBox(
                child: Center(
                  child: Text('No Hotels'),
                ),
              ),
            ),
          ),
        ],
      ),
    );});
  }
}
