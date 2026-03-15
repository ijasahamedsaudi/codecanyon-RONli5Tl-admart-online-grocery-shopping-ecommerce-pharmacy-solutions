import 'package:admart/base/api/services/basic_services.dart';
import 'package:flutter/material.dart';
import 'package:admart/base/utils/basic_import.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: Strings.appName.substring(0, 2), // first two letters
                style: CustomStyle.headlineLarge.copyWith(
                  fontFamily: 'Technor',
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor, // primary color
                ),
              ),
              TextSpan(
                text: Strings.appName.substring(2), // remaining letters
                style: CustomStyle.headlineLarge.copyWith(
                  fontFamily: 'Technor',
                  fontWeight: FontWeight.w600,
                  color: Colors.black, // black color
                ),
              ),
            ],
          ),
        ),
        TextWidget(BasicServices.siteTitle.value,
            style: CustomStyle.labelSmall.copyWith(
              fontWeight: FontWeight.w500,
              fontFamily: 'Technor',
            ),
            maxLines: 3,
            textAlign: TextAlign.center,
            padding: Dimensions.horizontalSize.edgeHorizontal,
            color: CustomColor.tertiaryDark.withValues(alpha: 0.6)),
      ],
    );
  }
}
