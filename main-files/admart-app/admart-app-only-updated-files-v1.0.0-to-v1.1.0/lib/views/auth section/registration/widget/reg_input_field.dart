part of '../screen/registration_screen.dart';

class RegInputField extends GetView<RegistrationController> {
  RegInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: LocalStorage.userStatus == "1",
          child: AbsorbPointer(
            absorbing: true,
            child: PhoneNumberInputField(
                textController: controller.passwordController),
          ),
        ),
        Sizes.height.v10,
        Row(
          children: [
            Expanded(
              child: _inputBoxWidget(
                Strings.firstName,
                Strings.firstName,
                controller.firstNameController,
                removeEnter: true,
              ),
            ),
            Sizes.width.v10,
            Expanded(
              child: _inputBoxWidget(
                Strings.lastName,
                Strings.lastName,
                controller.lastNameController,
                removeEnter: true,
              ),
            ),
          ],
        ),
        Sizes.height.betweenInputBox,
        _inputBoxWidget(
          Strings.email,
          Strings.email,
          controller.emailAddressController,
        ),
        Sizes.height.betweenInputBox,
        _inputBoxWidget(
          Strings.password,
          Strings.password,
          controller.passwordController,
          isPasswordField: true,
        ),
      ],
    );
  }

  _inputBoxWidget(
    String label,
    String hintText,
    TextEditingController controller, {
    TextInputType? textInputType,
    bool isPasswordField = false,
    bool isOptional = false,
    bool removeEnter = false,
  }) {
    return PrimaryInputWidget(
      controller: controller,
      label: label,
      hintText: hintText,
      isPasswordField: isPasswordField,
      isOptional: isOptional,
      textInputType: textInputType,
      removeLabelEnter: removeEnter,
    );
  }

  _methodSelection() {
    return SizedBox(
      height: Dimensions.heightSize * 4,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(Get.find<LoginController>().loginMethod.length,
            (index) {
          return _methodButton(index);
        }),
      ),
    );
  }

  _methodButton(int index) {
    var data = Get.find<LoginController>().loginMethod[index];
    return GestureDetector(onTap: () {
      controller.selectedMethodIndex.value = index;
    }, child: Obx(() {
      bool isSelected = controller.selectedMethodIndex.value == index;
      return Padding(
        padding: EdgeInsets.only(right: Dimensions.horizontalSize),
        child: Column(
          children: [
            TextWidget(
              data,
              typographyStyle: TypographyStyle.titleSmall,
              color: isSelected
                  ? CustomColor.primary
                  : CustomColor.typographyShade[40],
            ),
            Sizes.height.v5,
            Container(
              height: 3,
              width: 30,
              color: isSelected ? CustomColor.primary : Colors.transparent,
            )
          ],
        ),
      );
    }));
  }
}
