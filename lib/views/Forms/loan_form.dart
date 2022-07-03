import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task/configurations/size_config.dart';
import 'package:flutter_task/constants/app_colors.dart';
import 'package:flutter_task/constants/app_constants.dart';
import 'package:flutter_task/constants/app_strings.dart';
import 'package:flutter_task/custom_widgets/rounded_button.dart';
import 'package:flutter_task/utilities/general_utilities.dart';
import 'package:flutter_task/views/Forms/forms_vm.dart';
import 'package:flutter_task/views/Forms/login_view.dart';

class LoanForm extends StatefulWidget {
  // static const routeName = 'premliminaryForm';
  static const routeName = 'LoanForm';

  const LoanForm({Key? key}) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  int divisions = 18;
  double minimum = 100;
  double maximum = 1000;

  @override
  Widget build(BuildContext context) {
    // final formVm = Provider.of<FormsVm>(context, listen: false);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.04,
                    ),
                    Center(
                      child: Text(
                        AppStrings.loanForm,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenHeight! * 0.025),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.04,
                    ),
                    customLabel(AppStrings.loanAmount),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Slider(
                              label: '${formVm.amount.round()}',
                              activeColor: AppColors.kLightGreySlideToolTipColor,
                              // inactiveColor: Colors.grey,
                              thumbColor: AppColors.kLightGreySlideToolTipColor,
                              divisions: divisions,
                              min: minimum,
                              max: maximum,
                              value: formVm.amount,
                              onChanged: (val) {
                                formVm.amount = val;
                                // setState(() {});
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.screenWidth! * 0.05),
                          child: Text(
                            formVm.amount != null ? formVm.amount.toStringAsFixed(1).split('.').first + "€" : "0",
                            style:
                                TextStyle(color: AppColors.kTextColorGrey, fontSize: SizeConfig.screenHeight! * 0.021),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    customLabel(AppStrings.timePeriod),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.screenWidth! * 0.04,
                      ),
                      child: DropdownButton(
                        value: formVm.timePeriod,
                        onChanged: (String? newValue) {
                          formVm.timePeriod = newValue!;
                        },
                        items: AppConstants.dropdownItems,
                        // alignment:AlignmentDirectional.bottomCenter ,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customLabel(AppStrings.monthlyRate),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.screenWidth! * 0.04),
                          child: CustomFormButton(
                            text: "Calculate",
                            onTap: () {
                              // formVm.loading = true;
                              print('loader value is ${formVm.loading}');
                              formVm.calculateMonthlyRate();
                              // formVm.loading = false;
                              print('loader value is ${formVm.loading}');
                            },
                            color: AppColors.kLightGreySlideToolTipColor,
                            textColor: AppColors.kWhiteColor,
                            height: SizeConfig.screenHeight! * 0.035,
                            width: SizeConfig.screenWidth! * 0.27,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.02,
                    ),
                    formVm.loading == false
                        ? Text(
                            formVm.monthlyRate == 0.0 ? ' - -  - -' : formVm.monthlyRate.toStringAsFixed(2) + " €",
                            style:
                                TextStyle(color: AppColors.kTextColorGrey, fontSize: SizeConfig.screenHeight! * 0.021),
                          )
                        : GeneralUtilities.loaderWidget(),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.1,
                    ),
                    CustomFormButton(
                      text: "Next",
                      onTap: () {
                        if (formVm.monthlyRate == 0.0) {
                          GeneralUtilities.showMessage(
                              context: context, title: "info", text: "Please calculate monthly rate to continue");
                        }
                        else{
                          Navigator.pushNamed(context, PersonalDataForm.routeName);
                        }
                        // print('amount selected is ${formVm.amount}');
                        // print('time Period  is ${formVm.timePeriod}');
                        // formVm.calculateMonthlyRate();
                        // print('monthlyRate is ${formVm.monthlyRate}');
                      },
                      color: AppColors.kLightGreySlideToolTipColor,
                      textColor: AppColors.kWhiteColor,
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.7,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customLabel(String label) {
    return Text(
      label,
      style: TextStyle(
          color: AppColors.kBlackColor, fontSize: SizeConfig.screenHeight! * 0.023, fontWeight: FontWeight.normal),
    );
  }

// @override
// Widget build(BuildContext context) {
//   final formVm = Provider.of<FormsVm>(context, listen: false);
//   SizeConfig().init(context);
//   return SingleChildScrollView(
//     child: Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: SizeConfig.screenWidth! * 0.1,
//         vertical: SizeConfig.screenHeight! * 0.1,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text(
//             "Loan Form",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: SizeConfig.screenWidth! * 0.03),
//           RoundedInputField(
//             hintText: "amount",
//             icon: Icons.person,
//             onChanged: (value) {
//               setState(() {
//                 amount = int.parse(value);
//               });
//             },
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               // Text(
//               //   AppStrings.amount,
//               //   style: TextStyle(color: AppColors.kWhiteColor, fontSize: SizeConfig.screenHeight! * 0.02),
//               // ),
//               Expanded(
//                 child: CupertinoSlider(
//                     activeColor: Colors.orangeAccent,
//                     // inactiveColor: Colors.grey,
//                     thumbColor: Colors.orangeAccent,
//                     divisions: divisions,
//                     min: minimum,
//                     max: maximum,
//                     value: formVm.amount,
//                     onChanged: (val) {
//                       formVm.amount = val;
//                       setState(() {});
//                     }),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(right: SizeConfig.screenWidth! * 0.02),
//                 child: Text(
//                   formVm.amount != null ? formVm.amount.toStringAsFixed(1).split('.').first + "€" : "0%",
//                   style: TextStyle(color: AppColors.kPrimaryColor),
//                 ),
//               ),
//             ],
//           ),
//           RoundedInputField(
//             hintText: "time",
//             icon: Icons.person,
//             onChanged: (value) {
//               setState(() {
//                 time = int.parse(value);
//               });
//             },
//           ),
//           RoundedButton(
//             text: "Calculate",
//             onTap: () {
//               // formVm.amount = amount;
//               formVm.time = time;
//               formVm.calculateMonthlyRate();
//               print('loan per month is ${formVm.loanAmount}');
//
//               // Navigator.pushNamed(context, PersonalDataForm.routeName);
//             },
//             color: Colors.grey,
//             textColor: AppColors.kWhiteColor,
//           ),
//           SizedBox(height: SizeConfig.screenWidth! * 0.03),
//         ],
//       ),
//     ),
//   );
// }
}
