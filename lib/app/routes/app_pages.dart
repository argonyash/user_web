import 'package:get/get.dart';

import '../../Constants/sizeConstant.dart';
import '../../Constants/string_constants.dart';
import '../../main.dart';
import '../modules/attandance/bindings/attandance_binding.dart';
import '../modules/attandance/views/attandance_view.dart';
import '../modules/attandance_new/bindings/attandance_new_binding.dart';
import '../modules/attandance_new/views/attandance_new_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_drawer/bindings/home_drawer_binding.dart';
import '../modules/home_drawer/views/home_drawer_view.dart';
import '../modules/home_main/bindings/home_main_binding.dart';
import '../modules/home_main/views/home_main_view.dart';
import '../modules/leave/bindings/leave_binding.dart';
import '../modules/leave/views/leave_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL =
      (!isNullEmptyOrFalse(box.read(StringConstants.isUserLogIn)))
          ? Routes.HOME
          : Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DRAWER,
      page: () => HomeDrawerView(),
      binding: HomeDrawerBinding(),
    ),
    GetPage(
      name: _Paths.ATTANDANCE,
      page: () => AttandanceView(),
      binding: AttandanceBinding(),
    ),
    GetPage(
      name: _Paths.LEAVE,
      page: () => LeaveView(),
      binding: LeaveBinding(),
    ),
    GetPage(
      name: _Paths.ATTANDANCE_NEW,
      page: () => AttandanceNewView(),
      binding: AttandanceNewBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MAIN,
      page: () => HomeMainView(),
      binding: HomeMainBinding(),
    ),
  ];
}
