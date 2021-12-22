import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_sample_profile/src/controller/image_crop_controller.dart';
import 'package:kakao_sample_profile/src/controller/profile_controller.dart';
import 'package:kakao_sample_profile/src/profile.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: Colors.white),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<ProfileController>(() => ProfileController());
        Get.lazyPut<ImageCropController>(() => ImageCropController());
      }),
      home: Profile(),
    );
  }
}
