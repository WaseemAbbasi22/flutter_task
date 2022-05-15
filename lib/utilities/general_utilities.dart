import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';

class GeneralUtilities {
  static int stringConversion(String string) {
    int value = int.parse(string.split(' ').first);
    // print("formated String value is $value");
    return value;
  }

  static Widget loaderWidget() {
    return SizedBox(
      height: SizeConfig.screenHeight! * 0.028,
      width: SizeConfig.screenWidth! * 0.06,
      child:  const CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.kLightGreySlideToolTipColor,
      ),
    );
  }
}
