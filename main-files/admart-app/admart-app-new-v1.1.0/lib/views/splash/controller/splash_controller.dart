import 'dart:async';

import 'package:admart/base/utils/local_storage.dart';
import 'package:get/get.dart';

import '../../../base/api/services/basic_services.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(const Duration(seconds: 3), () {
      LocalStorage.isLoggedIn
          ? Get.offAllNamed(Routes.navigation)
          : BasicServices.onboardScreen.isEmpty || LocalStorage.onboardSave
              ? Get.offAllNamed(Routes.navigation)
              : Get.offAllNamed(Routes.onboardScreen);
    });
  }
}
