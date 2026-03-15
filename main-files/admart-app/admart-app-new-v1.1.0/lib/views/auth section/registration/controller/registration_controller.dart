import 'package:admart/base/utils/basic_import.dart';
import 'package:admart/base/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base/api/services/auth_services.dart';
import '../../../../base/api/services/basic_services.dart';
import '../../../../routes/routes.dart';

class RegistrationController extends GetxController {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  final pinController = TextEditingController();

  final referralIdController = TextEditingController();
  RxBool agree = false.obs;
  var selectedMethodIndex = 0.obs;
  RxString countrySelectMethod = ''.obs;

  // Routing
  get onRegistration => registrationProcess();
  get onLogIn => Routes.loginScreen.toNamed;
  get onPrivacyPolicy => '';
  RxBool isFormValid = false.obs;

  @override
  void onInit() {
    emailAddressController.addListener(_updateFormValidity);
    passwordController.addListener(_updateFormValidity);
    firstNameController.addListener(_updateFormValidity);
    lastNameController.addListener(_updateFormValidity);
    BasicServices.getBasicSettingsInfo();
    super.onInit();
  }

  void _updateFormValidity() {
    isFormValid.value = emailAddressController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty;
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  registrationProcess() async {
    return AuthServices.registrationProcess(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailAddressController.text,
      password: passwordController.text,
      dialCode: LocalStorage.email,
      isLoading: _isLoading,
    );
  }
}
