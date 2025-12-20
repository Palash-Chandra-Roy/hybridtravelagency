import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/data/responses/search_flights_response.dart';
import 'package:hybridtravelagency/screens/home/flight_book/FlightSearchScreen/flight_search_controller.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_book_controller.dart';
import 'package:hybridtravelagency/screens/sortandfilter/sort_and_filter_controller.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/utils/lists_widget.dart';
import 'package:hybridtravelagency/main.dart';

class FilterScreen extends StatelessWidget {
  FilterScreen({super.key});
  final SortAndFilterController filterController =
      Get.put(SortAndFilterController());

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CommonTextWidget.PoppinsLight(
                text: "Stops",
                color: grey717,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 135,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: GetBuilder<SortAndFilterController>(
                  init: SortAndFilterController(),
                  builder: (controller) => ListView.builder(
                    itemCount: Lists.filterList1.length,
                    padding: EdgeInsets.only(
                        left: 24, right: 24, top: 15, bottom: 25),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: InkWell(
                        onTap: () {
                          controller.onIndexChange(index);
                          filterController.isSelected.value = true;
                          controller.saveSortSelection("stops", index);
                        },
                        child: Container(
                          height: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: controller.selectedIndex == index
                                ? redCA0
                                : white,
                            boxShadow: [
                              BoxShadow(
                                color: grey7B7.withValues(alpha: 0.25),
                                offset: Offset(0, 1),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Column(
                              children: [
                                SizedBox(height: 5),
                                CommonTextWidget.PoppinsMedium(
                                  text: Lists.filterList1[index]["text1"],
                                  color: controller.selectedIndex == index
                                      ? white
                                      : black2E2,
                                  fontSize: 25,
                                ),
                                CommonTextWidget.PoppinsRegular(
                                  text: Lists.filterList1[index]["text2"],
                                  color: controller.selectedIndex == index
                                      ? white
                                      : black2E2,
                                  fontSize: 12,
                                ),
                                CommonTextWidget.PoppinsRegular(
                                  text: Lists.filterList1[index]["text3"],
                                  color: controller.selectedIndex == index
                                      ? white
                                      : grey717,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1, color: greyEEE),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CommonTextWidget.PoppinsLight(
                text:
                    "Departure From ${Get.find<FlightSearchController>().originController.text}",
                color: grey717,
                fontSize: 18,
              ),
            ),
            GetBuilder<SortAndFilterController>(
              init: SortAndFilterController(),
              builder: (controller) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio:
                      MediaQuery.of(context).size.aspectRatio * 2 / 0.3,
                ),
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 20),
                itemCount: Lists.filterList2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.onIndexChange1(index);
                      filterController.isSelected.value = true;
                      controller.saveSortSelection("departure_at", index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            controller.selectedIndex1 == index ? redCA0 : white,
                        boxShadow: [
                          BoxShadow(
                            color: grey7B7.withValues(alpha: 0.25),
                            offset: Offset(0, 1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CommonTextWidget.PoppinsRegular(
                          text: Lists.filterList2[index],
                          color: controller.selectedIndex1 == index
                              ? white
                              : grey717,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(thickness: 1, color: greyEEE),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CommonTextWidget.PoppinsLight(
                text:
                    "Arrival at ${Get.find<FlightSearchController>().destinationController.text}",
                color: grey717,
                fontSize: 18,
              ),
            ),
            GetBuilder<SortAndFilterController>(
              init: SortAndFilterController(),
              builder: (controller) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio:
                      MediaQuery.of(context).size.aspectRatio * 2 / 0.3,
                ),
                shrinkWrap: true,
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 20),
                itemCount: Lists.filterList2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.onIndexChange2(index);
                      filterController.isSelected.value = true;
                      controller.saveSortSelection("arrival_at", index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color:
                            controller.selectedIndex2 == index ? redCA0 : white,
                        boxShadow: [
                          BoxShadow(
                            color: grey7B7.withValues(alpha: 0.25),
                            offset: Offset(0, 1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Center(
                        child: CommonTextWidget.PoppinsRegular(
                          text: Lists.filterList2[index],
                          color: controller.selectedIndex2 == index
                              ? white
                              : grey717,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(thickness: 1, color: greyEEE),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CommonTextWidget.PoppinsLight(
                text: "Airline",
                color: grey717,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 15),
            GetBuilder<SortAndFilterController>(
              init: SortAndFilterController(),
              builder: (controller) {
                // Get all offers
                final offers = Get.find<FlightBookController>().allOffers;

                // Deduplicate by owner name
                final uniqueOwners = <String, Offers>{};
                for (var offer in offers) {
                  final ownerName = offer.owner?.name ?? '';
                  if (!uniqueOwners.containsKey(ownerName)) {
                    uniqueOwners[ownerName] = offer; // keep only the first one
                  }
                }

                final uniqueOffers = uniqueOwners.values.toList();

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: uniqueOffers.length,
                  itemBuilder: (context, index) {
                    var offer = uniqueOffers[index];
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.network(
                                  offer.owner?.logoSymbolUrl ?? '',
                                  width: 35,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(width: 15),
                                CommonTextWidget.PoppinsRegular(
                                  text: offer.owner?.name ?? '',
                                  color: black2E2,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            title: CommonTextWidget.PoppinsRegular(
                              text: offer.totalAmount ?? '',
                              color: grey717,
                              fontSize: 14,
                            ),
                            trailing: InkWell(
                              onTap: () async {
                                final airlineName = offer.owner?.name ?? "";
                                // final selectedAirlines = List<String>.from(
                                //     SharedPrefUtil.sortSelections["airlines"] ??
                                //         []);
                                //
                                // if (selectedAirlines.contains(airlineName)) {
                                //   selectedAirlines.remove(airlineName);
                                // } else {
                                //   selectedAirlines.add(airlineName);
                                // }
                                //
                                // await SharedPrefUtil.setAirlineSelections(
                                //     selectedAirlines);
                                controller.saveSortSelection('airlines', airlineName);
                                controller.onIndexChange3(index);
                                filterController.isSelected.value = true;
                                controller.update();
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: controller.selectedIndex3 == index
                                      ? redCA0
                                      : white,
                                  border: Border.all(
                                    color: controller.selectedIndex3 == index
                                        ? redCA0
                                        : grey717,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Divider(thickness: 1, color: greyEEE),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: CommonTextWidget.PoppinsLight(
                text: "Other filter",
                color: grey717,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 22),
            GetBuilder<SortAndFilterController>(
                init: SortAndFilterController(),
                builder: (controller) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonTextWidget.PoppinsRegular(
                            text: "Refundable Fares",
                            color: black2E2,
                            fontSize: 14,
                          ),
                          Obx(
                            () => InkWell(
                              onTap: () {
                                filterController.select.value =
                                    !filterController.select.value;
                                filterController.isSelected.value = true;
                                controller.saveSortSelection("refundable",
                                    filterController.select.value);
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: filterController.select.isTrue
                                      ? redCA0
                                      : white,
                                  border: Border.all(
                                    color: filterController.select.isTrue
                                        ? redCA0
                                        : grey717,
                                    width: 1.5,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
            SizedBox(height: 18),
            Divider(thickness: 1, color: greyEEE),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
