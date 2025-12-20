import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hybridtravelagency/data/repositories/connect_helper.dart';
import 'package:hybridtravelagency/data/repositories/data_repositories.dart';
import 'package:hybridtravelagency/data/repositories/repository.dart';

import 'navigators/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   await FirebaseMessageService
  //       .initialize(); // Assuming FirebaseMessageService is your custom service
  //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // } catch (ex) {
  //   debugPrint('Firebase initialization failed: $ex');
  // }
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(MyApp()));
}

Future<void> initServices() async {
  Get.put(
    Repository(
      Get.put(
        DataRepository(
          Get.put(
            ConnectHelper(),
            permanent: true,
          ),
        ),
        permanent: true,
      ),
    ),
    permanent: true,
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hybrid Travel',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
    //  home: SplashScreen(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
