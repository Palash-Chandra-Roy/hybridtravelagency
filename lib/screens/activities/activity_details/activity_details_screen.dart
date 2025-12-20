import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/screens/activities/activity_details/activity_details_controller.dart';
import 'package:hybridtravelagency/utils/mysize.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/shimmer_placeholder.dart';

class ActivityDetailsScreen extends StatelessWidget {
  const ActivityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return GetBuilder<ActivityDetailsController>(
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
              text: "Activity Details",
              color: black2E2,
              fontSize: 18,
            ),
          ),
          body: controller.isLoading
              ? activityDetailsShimmer()
              : controller.activityDetails == null
                  ? const Center(
                      child: Text('No activity details available'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image Gallery
                          if (controller.activityDetails?.tourImages != null &&
                              controller
                                  .activityDetails!.tourImages!.isNotEmpty)
                            _buildImageGallery(controller),

                          // Activity Title, Description, and Price
                          _buildTitleSection(controller),

                          // Activity Info (Duration, Language, etc.)
                          _buildActivityInfo(controller),

                          // Details & Highlights
                          if (controller.activityDetails?.tourDescription !=
                                  null &&
                              controller
                                  .activityDetails!.tourDescription!.isNotEmpty)
                            _buildDetailsAndHighlights(controller),

                          // Expandable Sections - only show if they have data
                          _buildExpandableSections(controller),

                          // Reviews Section
                          if (controller.activityDetails?.tourReview != null &&
                              controller
                                  .activityDetails!.tourReview!.isNotEmpty)
                            _buildReviewsSection(controller),

                          SizedBox(height: MySize.size20),
                        ],
                      ),
                    ),
          bottomNavigationBar:
              controller.isLoading || controller.activityDetails == null
                  ? null
                  : _buildBottomButton(controller),
        );
      },
    );
  }

  Widget _buildImageGallery(ActivityDetailsController controller) {
    final images = controller.activityDetails?.tourImages ?? [];

    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return Image.network(
          images[index].imagePath ?? '',
          width: double.infinity,
          height: MySize.size300,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: greyE9E,
              child: Center(
                child: Icon(Icons.image, size: MySize.size80, color: grey717),
              ),
            );
          },
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
    );
  }

  Widget _buildTitleSection(ActivityDetailsController controller) {
    return Padding(
      padding: EdgeInsets.all(MySize.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.activityDetails?.tourName != null &&
              controller.activityDetails!.tourName!.isNotEmpty)
            CommonTextWidget.PoppinsSemiBold(
              text: controller.activityDetails!.tourName!,
              color: black2E2,
              fontSize: 22,
              maxLines: 3,
            ),
          if (controller.activityDetails?.tourShortDescription != null &&
              controller.activityDetails!.tourShortDescription!.isNotEmpty) ...[
            SizedBox(height: MySize.size8),
            Html(
              data: controller.activityDetails!.tourShortDescription!,
              style: {
                "body": Style(
                  margin: Margins.zero,
                  padding: HtmlPaddings.zero,
                  fontSize: FontSize(14),
                  color: grey717,
                  fontFamily: 'PoppinsRegular',
                ),
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActivityInfo(ActivityDetailsController controller) {
    final details = controller.activityDetails;

    // Build list of info items that have data
    List<Widget> infoItems = [];

    if (details?.duration != null && details!.duration!.isNotEmpty) {
      infoItems.add(
          _buildInfoItem(Icons.access_time, 'Duration', details.duration!));
    }

    if (details?.tourLanguage != null && details!.tourLanguage!.isNotEmpty) {
      infoItems.add(
          _buildInfoItem(Icons.language, 'Language', details.tourLanguage!));
    }

    if (details?.departurePoint != null &&
        details!.departurePoint!.isNotEmpty) {
      infoItems.add(_buildInfoItem(
          Icons.schedule, 'Departure Time', details.departurePoint!));
    }

    if (details?.reportingTime != null && details!.reportingTime!.isNotEmpty) {
      infoItems.add(_buildInfoItem(
          Icons.location_on, 'Meeting Point', details.reportingTime!));
    }

    if (details?.startTime != null && details!.startTime!.isNotEmpty) {
      infoItems.add(_buildInfoItem(
          Icons.access_time_filled, 'Start Time', details.startTime!));
    }

    // Only return the container if we have info items
    if (infoItems.isEmpty) return SizedBox.shrink();

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
            text: 'Activity Information',
            color: black2E2,
            fontSize: 16,
          ),
          SizedBox(height: MySize.size12),
          ...infoItems
              .map((item) => Padding(
                    padding: EdgeInsets.only(bottom: MySize.size8),
                    child: item,
                  ))
              ,
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: primary, size: MySize.size20),
        SizedBox(width: MySize.size12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget.PoppinsMedium(
                text: label,
                color: grey717,
                fontSize: 12,
              ),
              SizedBox(height: MySize.size2),
              CommonTextWidget.PoppinsRegular(
                text: value,
                color: black2E2,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsAndHighlights(ActivityDetailsController controller) {
    return Padding(
      padding: EdgeInsets.all(MySize.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextWidget.PoppinsSemiBold(
            text: 'Details & Highlights',
            color: black2E2,
            fontSize: 18,
          ),
          SizedBox(height: MySize.size16),
          CommonTextWidget.PoppinsSemiBold(
            text: 'Overview',
            color: black2E2,
            fontSize: 16,
          ),
          SizedBox(height: MySize.size8),
          Html(
            data: controller.activityDetails!.tourDescription!,
            style: {
              "body": Style(
                margin: Margins.zero,
                padding: HtmlPaddings.zero,
                fontSize: FontSize(14),
                color: grey717,
                fontFamily: 'PoppinsRegular',
              ),
              "p": Style(
                margin: Margins.only(bottom: 4),
              ),
              "strong": Style(
                fontFamily: 'PoppinsSemiBold',
                color: black2E2,
              ),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSections(ActivityDetailsController controller) {
    List<Widget> sections = [];

    // Only add sections if they have data
    if (controller.activityDetails?.whatsInThisTour != null &&
        controller.activityDetails!.whatsInThisTour!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Highlights',
        controller.activityDetails!.whatsInThisTour!,
        controller.isHighlightsExpanded,
        controller.toggleHighlights,
      ));
    }

    if (controller.activityDetails?.importantInformation != null &&
        controller.activityDetails!.importantInformation!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Important Information',
        controller.activityDetails!.importantInformation!,
        controller.isImportantInfoExpanded,
        controller.toggleImportantInfo,
      ));
    }

    if (controller.activityDetails?.usefulInformation != null &&
        controller.activityDetails!.usefulInformation!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Know Before You Go',
        controller.activityDetails!.usefulInformation!,
        controller.isKnowBeforeYouGoExpanded,
        controller.toggleKnowBeforeYouGo,
      ));
    }

    if (controller.activityDetails?.itenararyDescription != null &&
        controller.activityDetails!.itenararyDescription!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Itinerary',
        controller.activityDetails!.itenararyDescription!,
        controller.isItineraryExpanded,
        controller.toggleItinerary,
      ));
    }

    if (controller.activityDetails?.howToRedeem != null &&
        controller.activityDetails!.howToRedeem!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'How to Redeem',
        controller.activityDetails!.howToRedeem!,
        controller.isHowToRedeemExpanded,
        controller.toggleHowToRedeem,
      ));
    }

    if (controller.activityDetails?.tourInclusion != null &&
        controller.activityDetails!.tourInclusion!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Inclusions',
        controller.activityDetails!.tourInclusion!,
        controller.isInclusionsExpanded,
        controller.toggleInclusions,
      ));
    }

    if (controller.activityDetails?.faqDetails != null &&
        controller.activityDetails!.faqDetails!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'FAQ',
        controller.activityDetails!.faqDetails!,
        controller.isFaqExpanded,
        controller.toggleFaq,
      ));
    }

    if (controller.activityDetails?.termsAndConditions != null &&
        controller.activityDetails!.termsAndConditions!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Terms & Conditions',
        controller.activityDetails!.termsAndConditions!,
        controller.isTermsExpanded,
        controller.toggleTerms,
      ));
    }

    if (controller.activityDetails?.cancellationPolicyDescription != null &&
        controller.activityDetails!.cancellationPolicyDescription!.isNotEmpty) {
      sections.add(_buildExpandableSection(
        'Cancellation Policy',
        controller.activityDetails!.cancellationPolicyDescription!,
        controller.isCancellationPolicyExpanded,
        controller.toggleCancellationPolicy,
      ));
    }

    // If no sections have data, return empty widget
    if (sections.isEmpty) return SizedBox.shrink();

    return Column(children: sections);
  }

  Widget _buildExpandableSection(
    String title,
    String content,
    RxBool isExpanded,
    VoidCallback onToggle,
  ) {
    return Obx(
      () => Container(
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
                      isExpanded.value
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_right,
                      color: black2E2,
                      size: MySize.size24,
                    ),
                  ],
                ),
              ),
            ),
            if (isExpanded.value)
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
      ),
    );
  }

  Widget _buildReviewsSection(ActivityDetailsController controller) {
    final reviews = controller.activityDetails?.tourReview ?? [];

    return Padding(
      padding: EdgeInsets.all(MySize.size16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget.PoppinsSemiBold(
                text: 'Reviews',
                color: black2E2,
                fontSize: 18,
              ),
              if (controller.activityDetails?.reviewCount != null)
                CommonTextWidget.PoppinsRegular(
                  text: '${controller.activityDetails!.reviewCount} reviews',
                  color: grey717,
                  fontSize: 14,
                ),
            ],
          ),
          SizedBox(height: MySize.size12),
          if (controller.activityDetails?.rating != null)
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: MySize.size20),
                SizedBox(width: MySize.size4),
                CommonTextWidget.PoppinsSemiBold(
                  text: '${controller.activityDetails!.rating}',
                  color: black2E2,
                  fontSize: 16,
                ),
              ],
            ),
          SizedBox(height: MySize.size16),
          ...reviews
              .take(3)
              .map((review) => Container(
                    margin: EdgeInsets.only(bottom: MySize.size12),
                    padding: EdgeInsets.all(MySize.size12),
                    decoration: BoxDecoration(
                      color: whiteF4F,
                      borderRadius: BorderRadius.circular(MySize.size12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (review.guestName != null &&
                                review.guestName!.isNotEmpty)
                              Expanded(
                                child: CommonTextWidget.PoppinsSemiBold(
                                  text: review.guestName!,
                                  color: black2E2,
                                  fontSize: 14,
                                ),
                              ),
                            if (review.rating != null &&
                                review.rating!.isNotEmpty)
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.orange,
                                      size: MySize.size16),
                                  SizedBox(width: MySize.size4),
                                  CommonTextWidget.PoppinsRegular(
                                    text: review.rating!,
                                    color: black2E2,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                          ],
                        ),
                        if (review.reviewTitle != null &&
                            review.reviewTitle!.isNotEmpty) ...[
                          SizedBox(height: MySize.size4),
                          CommonTextWidget.PoppinsMedium(
                            text: review.reviewTitle!,
                            color: black2E2,
                            fontSize: 13,
                          ),
                        ],
                        if (review.reviewContent != null &&
                            review.reviewContent!.isNotEmpty) ...[
                          SizedBox(height: MySize.size4),
                          CommonTextWidget.PoppinsRegular(
                            text: review.reviewContent!,
                            color: grey717,
                            fontSize: 12,
                            maxLines: 3,
                          ),
                        ],
                        if (review.visitMonth != null &&
                            review.visitMonth!.isNotEmpty) ...[
                          SizedBox(height: MySize.size4),
                          CommonTextWidget.PoppinsRegular(
                            text: review.visitMonth!,
                            color: grey717,
                            fontSize: 11,
                          ),
                        ],
                      ],
                    ),
                  ))
              ,
        ],
      ),
    );
  }

  Widget _buildBottomButton(ActivityDetailsController controller) {
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
          text: "Get Ticket",
          onTap: () {
            // Navigate to booking screen
          },
          buttonColor: primary,
        ),
      ),
    );
  }
}
