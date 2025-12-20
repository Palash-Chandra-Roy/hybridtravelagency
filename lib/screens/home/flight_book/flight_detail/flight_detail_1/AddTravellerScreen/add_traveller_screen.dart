import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/constants/colors.dart';
import 'package:hybridtravelagency/constants/images.dart';
import 'package:hybridtravelagency/data/models/traveller_model.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_1/ScanScreen/scan_screen.dart';
import 'package:hybridtravelagency/screens/home/flight_book/flight_detail/flight_detail_controller.dart';
import 'package:hybridtravelagency/widgets/common_button_widget.dart';
import 'package:hybridtravelagency/widgets/common_text_widget.dart';
import 'package:hybridtravelagency/widgets/common_textfield_widget.dart';

class AddTravellerScreen extends StatelessWidget {
  AddTravellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlightDetailController>(
        builder: (controller) {
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
          child: Icon(Icons.close, color: white, size: 20),
        ),
        title: CommonTextWidget.PoppinsSemiBold(
          text: "Add Traveller",
          color: white,
          fontSize: 18,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            color: orangeEB9.withValues(alpha: 0.2),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: CommonTextWidget.PoppinsRegular(
                text: "Enter name as mentioned on your passport for "
                    "Government approved IDs.",
                color: black2E2,
                fontSize: 13,
              ),
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyE2E, width: 1),
                    ),
                    child: ListTile(
                      leading: SvgPicture.asset(scan),
                      title: CommonTextWidget.PoppinsMedium(
                        text: "Scan to auto-fill this form!",
                        color: black2E2,
                        fontSize: 13,
                      ),
                      subtitle: CommonTextWidget.PoppinsRegular(
                        text: "Fetch details from your passport",
                        color: grey717,
                        fontSize: 13,
                      ),
                      trailing: InkWell(
                        onTap: (){
                          Get.bottomSheet(
                            ScanScreen(),
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                          );
                        },
                        child: CommonTextWidget.PoppinsMedium(
                          text: "SCAN",
                          color: redCA0,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  CommonTextWidget.PoppinsMedium(
                    text: "GENDER",
                    color: grey717,
                    fontSize: 14,
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.updateGender("MALE"),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: controller.selectedGender == "MALE" ? redCA0 : greyE2E,
                                  width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: CommonTextWidget.PoppinsMedium(
                                text: "MALE",
                                color: controller.selectedGender == "MALE" ? redCA0 : grey717,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: InkWell(
                          onTap: () => controller.updateGender("FEMALE"),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: controller.selectedGender == "FEMALE" ? redCA0 : greyE2E,
                                  width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: CommonTextWidget.PoppinsMedium(
                                text: "FEMALE",
                                color: controller.selectedGender == "FEMALE" ? redCA0 : grey717,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  CommonTextFieldWidget.TextFormField4(
                    hintText: "First & Middle Name",
                    controller: controller.firstAndMiddleNameController,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20),
                  CommonTextFieldWidget.TextFormField4(
                    hintText: "Last Name",
                    controller: controller.lastNameController,
                    keyboardType: TextInputType.text,
                  ),
                  Spacer(),
                  CommonButtonWidget.button(
                    text: "CONFIRM",
                    buttonColor: primary,
                    onTap: () {
                      final traveller = Traveller(
                        firstName: controller.firstAndMiddleNameController.text.trim(),
                        lastName: controller.lastNameController.text.trim(),
                        gender: controller.selectedGender,
                      );

                      Get.find<FlightDetailController>().addTraveller(traveller);
                      Get.back();
                    },
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );});
  }
}
