import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/home/HolidayPackagesScreen/holiday_details/holiday_details_controller.dart';
import 'package:hybridtravelagency/utils/mysize.dart';
import 'package:hybridtravelagency/utils/utils.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/loading_indicator.dart';

class HolidayDetailsScreen extends StatelessWidget {
  const HolidayDetailsScreen({super.key});

  /// Helper method to get holiday images
  List<String> _getHolidayImages(HolidayDetailsController controller) {
    final List<String> images = [];

    // Add package image
    if (controller.holidayDetails?.packageImage != null &&
        controller.holidayDetails!.packageImage!.isNotEmpty) {
      images.add(controller.holidayDetails!.packageImage!);
    }

    // Parse and add gallery images
    if (controller.holidayDetails?.galleryImages != null &&
        controller.holidayDetails!.galleryImages!.isNotEmpty) {
      try {
        // Try parsing as JSON array
        final galleryList =
            jsonDecode(controller.holidayDetails!.galleryImages!);
        if (galleryList is List) {
          for (var item in galleryList) {
            if (item is String && item.isNotEmpty) {
              images.add(item);
            }
          }
        }
      } catch (e) {
        // If not JSON, try comma-separated
        final galleryUrls =
            controller.holidayDetails!.galleryImages!.split(',');
        for (var url in galleryUrls) {
          final trimmedUrl = url.trim();
          if (trimmedUrl.isNotEmpty) {
            images.add(trimmedUrl);
          }
        }
      }
    }

    return images;
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<HolidayDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: white,
          appBar: AppBar(
            backgroundColor: white,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: black2E2, size: 20),
            ),
            title: CommonTextWidget.PoppinsSemiBold(
              text: "Holiday Details",
              color: black2E2,
              fontSize: 18,
            ),
          ),
          body: controller.isLoading
              ? const Center(child: LoadingIndicator())
              : controller.holidayDetails == null
                  ? const Center(
                      child: Text('No holiday details available'),
                    )
                  : CustomScrollView(
                      slivers: [
                        // App Bar with Image
                        // _buildSliverAppBar(controller),

                        // Body Content
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image Gallery Carousel
                              _buildImageGallery(controller),

                              // Holiday Title, Duration, and Price
                              _buildTitleSection(controller),

                              // Package Inclusions
                              _buildInclusionsSection(controller),

                              // Package Members & Duration
                              _buildPackageInfoSection(controller),

                              // Expandable Sections
                              _buildExpandableSections(controller),

                              SizedBox(height: MySize.size20),
                            ],
                          ),
                        ),
                      ],
                    ),
          bottomNavigationBar:
              controller.isLoading || controller.holidayDetails == null
                  ? null
                  : _buildBottomButton(controller),
        );
      },
    );
  }

  Widget _buildImageGallery(HolidayDetailsController controller) {
    final images = _getHolidayImages(controller);

    if (images.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              width: Get.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.3),
                    ],
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: images.length > 1,
            height: MySize.size300,
            enableInfiniteScroll: images.length > 1,
            enlargeCenterPage: false,
            viewportFraction: 1.0,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
          ),
        ),
        SizedBox(height: MySize.size16),
      ],
    );
  }

  Widget _buildTitleSection(HolidayDetailsController controller) {
    return Padding(
      padding: EdgeInsets.all(MySize.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.holidayDetails?.title != null &&
              controller.holidayDetails!.title!.isNotEmpty)
            CommonTextWidget.PoppinsSemiBold(
              text: controller.holidayDetails!.title!,
              color: black2E2,
              fontSize: 22,
              maxLines: 3,
            ),
          if (controller.holidayDetails?.location != null &&
              controller.holidayDetails!.location!.isNotEmpty) ...[
            SizedBox(height: MySize.size12),
            Row(
              children: [
                Icon(Icons.location_on, color: redCA0, size: MySize.size18),
                SizedBox(width: MySize.size4),
                Expanded(
                  child: CommonTextWidget.PoppinsRegular(
                    text: controller.holidayDetails!.location!,
                    color: grey717,
                    fontSize: 14,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
          if (controller.holidayDetails?.price != null &&
              controller.holidayDetails!.price! > 0) ...[
            SizedBox(height: MySize.size12),
            Row(
              children: [
                CommonTextWidget.PoppinsRegular(
                  text: 'From ',
                  color: grey717,
                  fontSize: 14,
                ),
                CommonTextWidget.PoppinsSemiBold(
                  text: '${currency()} ${controller.holidayDetails!.price}',
                  color: black2E2,
                  fontSize: 18,
                ),
                CommonTextWidget.PoppinsRegular(
                  text: ' / Package',
                  color: grey717,
                  fontSize: 14,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInclusionsSection(HolidayDetailsController controller) {
    final holiday = controller.holidayDetails;

    // Build list of inclusions
    List<Widget> inclusions = [];

    if (holiday?.hotels == 1) {
      inclusions.add(_buildInclusionChip('Hotels', Icons.hotel));
    }
    if (holiday?.flight == 1) {
      inclusions.add(_buildInclusionChip('Flight', Icons.flight));
    }
    if (holiday?.activities == 1) {
      inclusions.add(_buildInclusionChip('Activities', Icons.local_activity));
    }
    if (holiday?.transfer == 1) {
      inclusions.add(_buildInclusionChip('Transfer', Icons.directions_car));
    }
    if (holiday?.visa == 1) {
      inclusions.add(_buildInclusionChip('Visa', Icons.credit_card));
    }
    if (holiday?.breakfast == 1) {
      inclusions.add(_buildInclusionChip('Breakfast', Icons.free_breakfast));
    }
    if (holiday?.lunch == 1) {
      inclusions.add(_buildInclusionChip('Lunch', Icons.lunch_dining));
    }
    if (holiday?.dinner == 1) {
      inclusions.add(_buildInclusionChip('Dinner', Icons.dinner_dining));
    }

    // Only show section if there are inclusions
    if (inclusions.isEmpty) return SizedBox.shrink();

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MySize.size16, vertical: MySize.size8),
      padding: EdgeInsets.all(MySize.size16),
      decoration: BoxDecoration(
        color: whiteF4F,
        borderRadius: BorderRadius.circular(MySize.size12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget.PoppinsSemiBold(
            text: 'Package Inclusions',
            color: black2E2,
            fontSize: 16,
          ),
          SizedBox(height: MySize.size12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: inclusions,
          ),
        ],
      ),
    );
  }

  Widget _buildInclusionChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MySize.size12,
        vertical: MySize.size8,
      ),
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(MySize.size20),
        border: Border.all(color: primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: primary, size: MySize.size16),
          SizedBox(width: MySize.size6),
          CommonTextWidget.PoppinsMedium(
            text: label,
            color: primary,
            fontSize: 12,
          ),
        ],
      ),
    );
  }

  Widget _buildPackageInfoSection(HolidayDetailsController controller) {
    List<Widget> infoRows = [];

    if (controller.holidayDetails?.daysnight != null &&
        controller.holidayDetails!.daysnight!.isNotEmpty) {
      infoRows.add(_buildInfoRow(
        Icons.calendar_today,
        'Duration',
        controller.holidayDetails!.daysnight!,
      ));
    }

    if (controller.holidayDetails?.packageMembers != null &&
        controller.holidayDetails!.packageMembers!.isNotEmpty) {
      if (infoRows.isNotEmpty) infoRows.add(SizedBox(height: MySize.size12));
      infoRows.add(_buildInfoRow(
        Icons.people,
        'Package Members',
        controller.holidayDetails!.packageMembers!,
      ));
    }

    // Only show section if there are info rows
    if (infoRows.isEmpty) return SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MySize.size16, vertical: MySize.size12),
      child: Column(
        children: infoRows,
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: primary, size: MySize.size20),
        SizedBox(width: MySize.size12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget.PoppinsMedium(
                text: label,
                color: grey717,
                fontSize: 14,
              ),
              Flexible(
                child: CommonTextWidget.PoppinsSemiBold(
                  text: value,
                  color: black2E2,
                  fontSize: 14,
                  maxLines: 2,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpandableSections(HolidayDetailsController controller) {
    return Column(
      children: [
        if (controller.holidayDetails?.pkgoverview != null &&
            controller.holidayDetails!.pkgoverview!.isNotEmpty)
          Obx(() => _buildExpandableSection(
                'Overview',
                controller.holidayDetails!.pkgoverview!,
                controller.isOverviewExpanded.value,
                controller.toggleOverview,
              )),
        if (controller.holidayDetails?.pkgitinerary != null &&
            controller.holidayDetails!.pkgitinerary!.isNotEmpty)
          Obx(() => _buildExpandableSection(
                'Itinerary',
                controller.holidayDetails!.pkgitinerary!,
                controller.isItineraryExpanded.value,
                controller.toggleItinerary,
              )),
        if (controller.holidayDetails?.pkginclusion != null &&
            controller.holidayDetails!.pkginclusion!.isNotEmpty)
          Obx(() => _buildExpandableSection(
                'Inclusions',
                controller.holidayDetails!.pkginclusion!,
                controller.isInclusionExpanded.value,
                controller.toggleInclusion,
              )),
        if (controller.holidayDetails?.pkgexclusion != null &&
            controller.holidayDetails!.pkgexclusion!.isNotEmpty)
          Obx(() => _buildExpandableSection(
                'Exclusions',
                controller.holidayDetails!.pkgexclusion!,
                controller.isExclusionExpanded.value,
                controller.toggleExclusion,
              )),
        if (controller.holidayDetails?.pkgtermsocondition != null &&
            controller.holidayDetails!.pkgtermsocondition!.isNotEmpty)
          Obx(() => _buildExpandableSection(
                'Terms & Conditions',
                controller.holidayDetails!.pkgtermsocondition!,
                controller.isTermsExpanded.value,
                controller.toggleTerms,
              )),
      ],
    );
  }

  Widget _buildExpandableSection(
    String title,
    String content,
    bool isExpanded,
    VoidCallback onToggle,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MySize.size16, vertical: MySize.size4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greyE9E, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: MySize.size16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CommonTextWidget.PoppinsSemiBold(
                      text: title,
                      color: black2E2,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_right,
                    color: black2E2,
                    size: MySize.size24,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: EdgeInsets.only(bottom: MySize.size16),
              child: Html(
                data: content,
                style: {
                  "body": Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    fontSize: FontSize(14),
                    color: grey717,
                    fontFamily: 'PoppinsRegular',
                  ),
                  "h1, h2, h3, h4, h5, h6": Style(
                    color: black2E2,
                    fontFamily: 'PoppinsSemiBold',
                  ),
                  "p": Style(
                    margin: Margins.only(bottom: 8),
                  ),
                  "ul": Style(
                    margin: Margins.only(left: 16, bottom: 8),
                  ),
                  "li": Style(
                    margin: Margins.only(bottom: 4),
                  ),
                  "strong": Style(
                    fontFamily: 'PoppinsSemiBold',
                    color: black2E2,
                  ),
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(HolidayDetailsController controller) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(MySize.size16),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: CommonButtonWidget.button(
          text: "Book Package",
          onTap: () {
            // Navigate to booking screen
          },
          buttonColor: primary,
        ),
      ),
    );
  }
}
