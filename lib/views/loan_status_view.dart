import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
import 'package:rns_flutter_task/constants/app_strings.dart';

import 'Forms/forms_vm.dart';

class LoanStatusView extends StatelessWidget {
  static const routeName = 'loanStatus';

  const LoanStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<FormsVm>(
      builder: (context, formVm, _) {
        return Scaffold(
          backgroundColor: Colors.blue[50],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.screenHeight! * 0.12,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/App-icon.svg"),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.03,
                    ),
                    Text(
                      AppStrings.appTitle,
                      style: TextStyle(
                          color: AppColors.kTextColorGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenHeight! * 0.025),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.07),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                height: SizeConfig.screenHeight! * 0.6,
                width: SizeConfig.screenWidth! * 0.84,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.04,
                    ),
                    Center(
                      child: Text(
                        AppStrings.details,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenHeight! * 0.025),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.04,
                    ),
                    customLabel(AppStrings.firstName, AppColors.kBlackColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    customSubLabel(AppStrings.firstName, AppColors.kTextColorGrey),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customLabel(AppStrings.lastName, AppColors.kBlackColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),

                    customSubLabel(AppStrings.lastName, AppColors.kTextColorGrey),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customLabel(AppStrings.monthlyIncom, AppColors.kBlackColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    customSubLabel(AppStrings.firstName, AppColors.kTextColorGrey),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customLabel(AppStrings.monthlyRate, AppColors.kBlackColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    customSubLabel(formVm.monthlyRate.toStringAsFixed(2) +" €", AppColors.kPurpleColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),

                    customLabel(AppStrings.score, AppColors.kBlackColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    customSubLabel(formVm.randomNumber.toString(), AppColors.kPurpleColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customLabel(AppStrings.status, AppColors.kBlackColor),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    customSubLabel(formVm.loanStatus,  AppColors.kPurpleColor),

                    // CustomFormButton(
                    //   text: "Next",
                    //   onTap: () {
                    //     if (formVm.monthlyRate == 0.0) {
                    //       GeneralUtilities.showMessage(
                    //           context: context, title: "info", text: "Please calculate monthly rate to continue");
                    //     }
                    //     else{
                    //       Navigator.pushNamed(context, PersonalDataForm.routeName);
                    //     }
                    //     // print('amount selected is ${formVm.amount}');
                    //     // print('time Period  is ${formVm.timePeriod}');
                    //     // formVm.calculateMonthlyRate();
                    //     // print('monthlyRate is ${formVm.monthlyRate}');
                    //   },
                    //   color: AppColors.kLightGreySlideToolTipColor,
                    //   textColor: AppColors.kWhiteColor,
                    //   height: SizeConfig.screenHeight! * 0.07,
                    //   width: SizeConfig.screenWidth! * 0.7,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customLabel(String label, Color color) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: SizeConfig.screenHeight! * 0.023, fontWeight: FontWeight.w600),
    );
  }

  Widget customSubLabel(String label, Color color) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: SizeConfig.screenHeight! * 0.02, fontWeight: FontWeight.normal),
    );
  }
}
