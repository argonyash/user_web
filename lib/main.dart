import 'package:argon_user/Constants/sizeConstant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kiwi/kiwi.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'Constants/app_module.dart';
import 'Constants/string_constants.dart';
import 'app/routes/app_pages.dart';

GetStorage box = GetStorage();
late KiwiContainer app;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = KiwiContainer();
  await GetStorage.init();

  setup();
  // print(box.read(StringConstants.userEmailAddress));
  // print(box.read(StringConstants.isUserLogIn));
  if (isNullEmptyOrFalse(box.read(StringConstants.isUserLogIn))) {
    box.write(StringConstants.isUserLogIn, false);
  }
  // print("asasa");
  runApp(
    GetMaterialApp(
      localizationsDelegates: [
        MonthYearPickerLocalizations.delegate,
      ],
      title: "Argon User",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
