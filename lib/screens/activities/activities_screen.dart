import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/data/responses/cities_response.dart';
import 'package:hybridtravelagency/data/responses/countries_response.dart';
import 'package:hybridtravelagency/navigators/routes_management.dart';
import 'package:hybridtravelagency/screens/activities/activities_controller.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/main.dart';

class ActivitiesScreen extends StatelessWidget {
  ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivitiesController>(builder: (controller) {
      return Scaffold(
        backgroundColor: white,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ---------- Header ----------
                Container(
                  height: 130,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(holidayPackagesImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: Get.back,
                          child: const Icon(Icons.arrow_back,
                              color: white, size: 20),
                        ),
                        CommonTextWidget.PoppinsSemiBold(
                          text: "Activities",
                          color: white,
                          fontSize: 18,
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                /// ---------- Country Selection ----------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget.PoppinsSemiBold(
                        text: "Select Country",
                        color: black2E2,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 6),
                      CommonTextWidget.PoppinsRegular(
                        text: "Grab best activities to enjoy, Book now",
                        color: grey717,
                        fontSize: 12,
                      ),
                      const SizedBox(height: 10),

                      /// Styled Autocomplete
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: greyE8E, width: 1),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Autocomplete<CountryData>(
                          optionsBuilder: (TextEditingValue value) {
                            if (value.text.isEmpty) {
                              return const Iterable<CountryData>.empty();
                            }
                            return SharedPrefUtil.countries!.where((country) =>
                                country.countryName!
                                    .toLowerCase()
                                    .contains(value.text.toLowerCase()));
                          },
                          displayStringForOption: (CountryData option) =>
                              option.countryName ?? '',
                          onSelected: (selected) async {
                            controller.setCountry(selected);
                            await controller.getCities(selected.countryId!);
                          },
                          fieldViewBuilder: (context, textController, focusNode,
                              onFieldSubmitted) {
                            return TextField(
                              controller: textController,
                              focusNode: focusNode,
                              decoration: const InputDecoration(
                                hintText: "Type country name...",
                                border: InputBorder.none,
                              ),
                            );
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: options.length,
                                    itemBuilder: (context, index) {
                                      final option = options.elementAt(index);
                                      return ListTile(
                                        title: Text(option.countryName ?? ''),
                                        onTap: () => onSelected(option),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),
                if (controller.isCitiesLoading)
                  const Center(child: CircularProgressIndicator())
                else if (controller.citiesList.isNotEmpty) ...[
                  /// ---------- City Selection ----------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextWidget.PoppinsSemiBold(
                          text: "Select City",
                          color: black2E2,
                          fontSize: 16,
                        ),
                        const SizedBox(height: 6),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: greyE8E, width: 1),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Autocomplete<CityData>(
                            optionsBuilder: (TextEditingValue value) {
                              if (value.text.isEmpty) {
                                return const Iterable<CityData>.empty();
                              }
                              return controller.citiesList.where((city) => city
                                  .cityName!
                                  .toLowerCase()
                                  .contains(value.text.toLowerCase()));
                            },
                            displayStringForOption: (CityData option) =>
                                option.cityName ?? '',
                            onSelected: (selected) async {
                              controller.setCity(selected);
                              await controller.searchActivities();
                            },
                            fieldViewBuilder: (context, textController,
                                focusNode, onFieldSubmitted) {
                              return TextField(
                                controller: textController,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                  hintText: controller.citiesList.isEmpty
                                      ? "Select a country first..."
                                      : "Type city name...",
                                  border: InputBorder.none,
                                ),
                              );
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      itemCount: options.length,
                                      itemBuilder: (context, index) {
                                        final option = options.elementAt(index);
                                        return ListTile(
                                          title: Text(option.cityName ?? ''),
                                          onTap: () => onSelected(option),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                /// ---------- Activities List ----------
                if (controller.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (controller.activitiesList != null &&
                    controller.activitiesList!.isEmpty)
                  const Center(child: Text("No activities found"))
                else if (controller.activitiesList != null)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.activitiesList!.length,
                    itemBuilder: (context, index) {
                      final activity = controller.activitiesList![index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            if (activity.tourId != null) {
                              RouteManagement.goToActivityDetailsScreen(
                                  activityId: activity.tourId!,
                                  contractId: activity.contractId!);
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (activity.imagePath != null)
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.network(
                                    activity.imagePath ?? '',
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: 120,
                                      color: Colors.grey[200],
                                      child: const Center(
                                          child: Text('Image Unavailable')),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonTextWidget.PoppinsSemiBold(
                                      text: activity.tourName ?? "No name",
                                      color: black2E2,
                                      fontSize: 18,
                                    ),
                                    const SizedBox(height: 6),
                                    CommonTextWidget.PoppinsRegular(
                                      text: activity.cityName ?? "",
                                      color: grey717,
                                      fontSize: 12,
                                    ),
                                    const SizedBox(height: 8),
                                    CommonTextWidget.PoppinsBold(
                                      text:
                                          "Price: ${currency()} ${activity.price ?? "N/A"}",
                                      color:
                                          Colors.black.withValues(alpha: 0.85),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
