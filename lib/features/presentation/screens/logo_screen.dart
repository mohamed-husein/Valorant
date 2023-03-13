import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/global/theme/theme_color/theme_color_light.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_constants.dart';
import '../../../core/utils/app_fonsts.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/custom_text.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: AppSizes.heightFullScreen - AppSizes.pH150,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppAssets.valorantLogo,
                // ignore: deprecated_member_use
                color: ThemeColorLight.white,
                width: AppSizes.pW200,
              ),
              CustomText(
                AppConstance.valo,
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontFamily: AppFonts.fontFamilyValorant,
                  fontSize: AppSizes.fs32,
                  color: ThemeColorLight.white,
                ),
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
