
import 'package:hybridtravelagency/data/models/response_model.dart';
import 'package:hybridtravelagency/utils/shared_pref_util.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/widgets/loading_indicator.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../navigators/routes_management.dart';

import 'package:intl/intl.dart';


typedef Sort = int Function(dynamic a, dynamic b);
typedef SortF = Sort Function(String sortField);

final dateFormatter = DateFormat('dd MMM');
final dayFormatter = DateFormat('E');
final yearFormatter = DateFormat('y');

SortF alphabetic = (String sortField) => (a, b) {
      return a[sortField].toLowerCase().compareTo(b[sortField].toLowerCase());
    };

SortF number = (String sortField) => (a, b) {
      return a[sortField].compareTo(b[sortField]);
    };

void showError(String message) {
  Get.snackbar(
    "Error",
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red,
    colorText: Colors.white,
  );
}
String? validatePassword(String value) {
  if (value.trim().isNotEmpty) {
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      if (value.contains(RegExp(r'[A-Z]')) ||
          value.contains(RegExp(r'[a-z]'))) {
        if (value.contains(RegExp(r'[0-9]'))) {
          if (value.length < 6) {
            return 'The password must be at least 8 characters long with one uppercase letter,one lowercase letter,one digit and one special character.';
          } else {
            return null;
          }
        } else {
          return 'The password must be at least 8 characters long with one uppercase letter,one lowercase letter,one digit and one special character.';
        }
      } else {
        return 'The password must be at least 8 characters long with one uppercase letter,one lowercase letter,one digit and one special character.';
      }
    } else {
      return 'The password must be at least 8 characters long with one uppercase letter,one lowercase letter,one digit and one special character.';
    }
  } else {
    return 'Password is required';
  }
}

bool emailValidator(String email) => EmailValidator.validate(email);

bool phoneValidator(String phone) {
// var pattern = r'^(?:[+0]9)?[0-9]{10}$';
  var pattern = r'^\+?(?:[ ()-]*\d){8,16}$';
  var regExp = RegExp(pattern);
  if (phone.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(phone)) {
    return false;
  }
  return true;
}

void datePickerDialog({
  required BuildContext context,
  required Function(DateTime, List<int>) onConfirm,
  DateTime? initialDateTime,
  DateTime? maxDateTime,
  DateTime? minDateTime,
  String dateFormat = 'MMMM-dd-yyyy',
}) {
  DatePicker.showDatePicker(
    context,
    minDateTime: minDateTime??initialDateTime,
    maxDateTime: maxDateTime,
    initialDateTime: initialDateTime ?? maxDateTime,
    dateFormat: dateFormat,
    onConfirm: onConfirm,
  );
}

/// Returns true if the internet connection is available.
Future<bool> isNetworkAvailable() async =>
    await InternetConnectionChecker.instance.hasConnection;
void closeDialog() {
  try {
    if (Get.isDialogOpen == true) {
      Get.back<void>();
    }
  } catch (e) {
    debugPrint("Error closing dialog: $e");
  }
}

/// Show loader
// void showLoader() async {
//   await Get.dialog<dynamic>(
//     Center(
//       child: LoadingAnimationWidget.inkDrop(
//         color: Colors.white,
//         size: 60,
//       ),
//     ),
//     barrierDismissible: false,
//     barrierColor: Colors.black.withValues(alpha: .7),
//   );
// }
void showLoader() async {
  await Get.dialog<dynamic>(
    Center(
      child: LoadingIndicator(
        radius: 20,
        activeColor: Theme.of(Get.context!).colorScheme.onPrimary,
        inactiveColor: Theme.of(Get.context!).colorScheme.primary,
        animationDuration: const Duration(milliseconds: 500),
      ),
    ),
    barrierDismissible: false,
    barrierColor: Theme.of(Get.context!).shadowColor.withValues(alpha: .7),
  );
}

/// Close loader
void closeLoader() {
  closeDialog();
}

/// Show error dialog from response model
void showErrorDialog(ResponseModel data, [bool isSuccess = false]) async {
  await Get.dialog<dynamic>(
    CupertinoAlertDialog(
      title: Text(isSuccess ? 'success' : 'invalid', style: Theme.of(Get.context!).textTheme.bodyLarge),
      content: Text(data.errorCode == 401 ? 'Unauthorized User' : 'Invalid', style: Theme.of(Get.context!).textTheme.bodyLarge),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Get.back<dynamic>();

            if (data.errorCode == 401) {
              SharedPrefUtil.isLogin = false;
              SharedPrefUtil.synchronizeSettingsToPhone().then((value) {
                SharedPrefUtil.synchronizeSettingsFromPhone().then((value) {
                  RouteManagement.goToLoginScreen();
                });
              });
            }
            // }
          },
          isDefaultAction: true,
          child: Text(
            'Ok',
            style: Theme.of(Get.context!).textTheme.bodyLarge,
          ),
        ),
      ],
    ),
  );
}

/// Show info dialog
void showDialogs(
  String message, {
  Function()? onPress,
  bool barrierDismissible = true,
}) async {
  await Get.dialog<void>(
    CupertinoAlertDialog(
      title: Text('Info', style: Theme.of(Get.context!).textTheme.bodyLarge),
      content: Text(
        message,
        style: Theme.of(Get.context!).textTheme.bodyLarge,
      ),
      actions: [
        CupertinoButton(
          onPressed: onPress ?? Get.back,
          child: Text(
            'Ok',
            style: Theme.of(Get.context!).textTheme.bodyLarge,
          ),
        ),
      ],
    ),
    barrierDismissible: barrierDismissible,
  );
}

/// Print info log.
///
/// [message] : The message which needed to be print.
void printILog(dynamic message) {
  debugPrint('$message');
}

String formatToDayMonth(String date) {
  // If string is null/empty, return empty
  if (date.trim().isEmpty) return "";

  final cleaned = date.trim();
  final parts = cleaned.split('-');

  // Ensure format has exactly 3 parts
  if (parts.length != 3) return "";

  final year = int.tryParse(parts[0].trim());
  final month = int.tryParse(parts[1].trim());
  final day = int.tryParse(parts[2].trim());

  // If any part is invalid, return empty
  if (year == null || month == null || day == null) return "";

  final parsedDate = DateTime(year, month, day);
  return DateFormat("d MMM").format(parsedDate); // e.g. "25 Sep"
}

String formatToDayMonthYear(String date) {
  if (date.trim().isEmpty) return "";

  try {
    final parsedDate = DateTime.parse(date.trim());
    return DateFormat("EEE, d MMM yy").format(parsedDate);
  } catch (e) {
    return "";
  }
}

String formatToDayDateMonth(String date) {
  if (date.trim().isEmpty) return "";

  try {
    final parsedDate = DateTime.parse(date.trim());
    return DateFormat("EEE, d MMM").format(parsedDate);
  } catch (e) {
    return "";
  }
}

String parseDateTimeToTime(String input){
  if (input.trim().isEmpty) return "";
  DateTime dateTime = DateTime.parse(input);
  String formattedTime = DateFormat.Hm().format(dateTime);
  return formattedTime;
}

String parseIntervalTimeHour(String t1, String t2){
  DateTime dt1 = DateTime.parse(t1);
  DateTime dt2 = DateTime.parse(t2);
  Duration diff = dt1.difference(dt2);
  return "${diff.inHours}h ";
}

String parseIntervalTimeMinutes(String t1, String t2){
  DateTime dt1 = DateTime.parse(t1);
  DateTime dt2 = DateTime.parse(t2);
  Duration diff = dt1.difference(dt2);
  return "${diff.inMinutes.remainder(60)}m";
}

int parseDuration(String t1, String t2){
  DateTime dt1 = DateTime.parse(t1);
  DateTime dt2 = DateTime.parse(t2);
  Duration diff = dt1.difference(dt2);
  return diff.inMinutes;
}

String stops(int segments) {
  var stops = segments - 1;
  if (stops == 0) {
    return ' Non stop';
  } else {
    if (stops == 1) {
      return "$stops stop";
    } else {
      return "$stops stops";
    }
  }
}

String currency (){
  return SharedPrefUtil.user!.currency??'';
}