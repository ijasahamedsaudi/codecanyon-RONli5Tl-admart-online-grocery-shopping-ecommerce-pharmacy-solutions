part of '../screen/registration_screen.dart';

class AlreadyAccount extends GetView<RegistrationController> {
  const AlreadyAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sizes.height.v30,
        Row(
          mainAxisAlignment: mainCenter,
          children: [
            TextWidget(
              Strings.alreadyHaveAn,
              colorShade: ColorShade.mediumForty,
              padding: Dimensions.horizontalSize.edgeHorizontal * 0.08,
              typographyStyle: TypographyStyle.titleSmall,
            ),
            Sizes.width.v5,
            TextWidget(
              Strings.loginNow,
              colorShade: ColorShade.mediumForty,
              fontWeight: FontWeight.w600,
              color: CustomColor.primary,
              typographyStyle: TypographyStyle.titleSmall,
              onTap: () {
                Routes.loginScreen.toNamed;
              },
            ),
          ],
        ),
        Sizes.height.v30,
      ],
    );
  }
}
