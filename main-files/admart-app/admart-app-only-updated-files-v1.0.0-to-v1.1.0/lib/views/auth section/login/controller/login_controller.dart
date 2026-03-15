import 'package:admart/assets/assets.dart';
import 'package:admart/base/utils/basic_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../../../base/api/services/auth_services.dart';
import '../../../../routes/routes.dart';
import '../model/country_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final Rxn<PhoneNumber> selectCountry = Rxn<PhoneNumber>();
  final emailAddressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();
  final otpController = TextEditingController();
  RxBool isFormValid = false.obs;
  RxBool isPhoneFormValid = false.obs;
  RxBool isRemember = false.obs;
  RxString dialCode = "".obs;
  get onForgotPassword => Routes.forgotPasswordOtpVerificationScreen.toNamed;
  get onRegistration => Routes.registrationScreen.toNamed;
  get onLogInProcess =>
      selectedMethodIndex.value == 0 ? logInProcess() : logInPhoneProcess();

  @override
  void onInit() {
    selectCountry.value = PhoneNumber(isoCode: IsoCode.AC, nsn: '');
    // emailAddressController.text = "user@appdevs.net";
    // passwordController.text = "appdevs";
    emailAddressController.addListener(_updateFormValidity);
    passwordController.addListener(_updateFormValidity);
    phoneNumberController.addListener(_updateFormValidity);
    ever(selectedMethodIndex, (_) => _updateFormValidity());
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  logInProcess() async {
    return AuthServices.logInService(
      credentials: emailAddressController.text,
      password: passwordController.text,
      isLoading: _isLoading,
    ).then((value) {
      emailAddressController.clear();
      passwordController.clear();
    });
  }

  // login with phone number
  logInPhoneProcess() async {
    return AuthServices.logInPhoneService(
      dialCode: "+${dialCode.value}",
      number: phoneNumberController.text,
      isLoading: _isLoading,
    ).then((value) {
      phoneNumberController.clear();
    });
  }

  logOutProcess() async {
    await _googleSignIn.signOut();
    googleAccount.value = null;
    return AuthServices.logOutService(
      isLoading: _isLoading,
    );
  }

  deleteAccountProcess() async {
    return AuthServices.deleteAccountServices(
      isLoading: _isLoading,
    );
  }

  void _updateFormValidity() {
    if (selectedMethodIndex.value == 0) {
      isFormValid.value = emailAddressController.text.isNotEmpty &&
              passwordController.text.isNotEmpty ||
          phoneNumberController.text.isNotEmpty;
    } else {
      isFormValid.value = phoneNumberController.text.isNotEmpty;
    }
    ;
  }

  // google login

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    // clientId:
    //     "241025086768-0avlp5im4fjqvk3u5t3uck9dpt7llrju.apps.googleusercontent.com",
//   scopes:  <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly',
// ]
  );
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  var authCode = ''.obs;
  var accessToken = ''.obs;
  var idToken = ''.obs;

  final _isGoogleLoading = false.obs;
  bool get isGoogleLoading => _isGoogleLoading.value;

  /// Sign In with Google
  Future<void> onGoogleLogin() async {
    try {
      await _googleSignIn.signOut();

      final account = await _googleSignIn.signIn();
      if (account != null) {
        googleAccount.value = account;

        final GoogleSignInAuthentication authentication =
            await account.authentication;

        accessToken.value = authentication.accessToken ?? '';

        AuthServices.loginWithGoogle(
          accessToken.value,
          _isGoogleLoading,
        );

        CustomSnackBar.success(
            title: Strings.success, message: Strings.loginSuccess);
      }
    } catch (error) {
      debugPrint("Error: $error");
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  final List<Country> countries = [];
  final selectedCountry = ''.obs;
  final leadingAsset = "".obs;

  var selectedMethodIndex = 0.obs;
  List loginMethod = [Strings.email, Strings.phoneNumber];

  List otherLoginMethod = [Assets.icons.google.path];
}
