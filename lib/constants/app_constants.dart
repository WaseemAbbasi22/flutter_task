import 'package:flutter/material.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';

class AppConstants {
  static List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "1 Month",
            style: TextStyle(
                fontSize: SizeConfig.screenHeight! * 0.02,
                color: AppColors.kTextColorGrey),
          ),
          value: "1 Month"),
      DropdownMenuItem(
          child: Text(
            "3 Months",
            style: TextStyle(
                fontSize: SizeConfig.screenHeight! * 0.02,
                color: AppColors.kTextColorGrey),
          ),
          value: "3 Months"),
      DropdownMenuItem(
          child: Text(
            "6 Months",
            style: TextStyle(
                fontSize: SizeConfig.screenHeight! * 0.02,
                color: AppColors.kTextColorGrey),
          ),
          value: "6 Months"),
      DropdownMenuItem(
          child: Text(
            "12 Months",
            style: TextStyle(
                fontSize: SizeConfig.screenHeight! * 0.02,
                color: AppColors.kTextColorGrey),
          ),
          value: "12 Months"),
    ];
    return menuItems;
  }
}
