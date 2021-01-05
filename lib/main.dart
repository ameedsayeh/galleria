import 'package:flutter/material.dart';
import 'package:galleria/app-wrapper.dart';
import 'package:galleria/services/photos-service.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PhotosService.shared.initDatabase();

  Get.updateLocale(Get.deviceLocale);

  runApp(
    AppWrapper(),
  );
}
