import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
import 'package:rns_flutter_task/constants/app_strings.dart';
import 'package:rns_flutter_task/custom_widgets/rounded_button.dart';
import 'package:rns_flutter_task/custom_widgets/rounded_input_field.dart';
import 'package:rns_flutter_task/views/Forms/forms_vm.dart';
import 'package:rns_flutter_task/views/Forms/personal_data_form.dart';

class LoanForm extends StatefulWidget {
  // static const routeName = 'premliminaryForm';
  static const routeName = '/';

  const LoanForm({Key? key}) : super(key: key);

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  int amount = 0;
  int time = 0;
  int divisions = 18;
  double minimum = 100;
  double maximum = 1000;
  TextEditingController emailNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formVm = Provider.of<FormsVm>(context, listen: false);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.screenHeight! * 0.12, top: SizeConfig.screenHeight! * 0.1),
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
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.04),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: SizeConfig.screenHeight! * 0.6,
              width: SizeConfig.screenWidth! * 0.84,
              child: SingleChildScrollView(
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
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customLabel(AppStrings.loanAmount),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                setState(() {});
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.screenWidth! * 0.02),
                          child: Text(
                            formVm.amount != null ? formVm.amount.toStringAsFixed(1).split('.').first + "€" : "0%",
                            style:
                                TextStyle(color: AppColors.kPrimaryColor, fontSize: SizeConfig.screenHeight! * 0.021),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    Container(
                      decoration:
                          BoxDecoration(color: AppColors.kContainerColor, borderRadius: BorderRadius.circular(5)),
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.7,
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customLabel(String label) {
    return Padding(
        padding: EdgeInsets.only(left: SizeConfig.screenHeight! * 0.01, top: SizeConfig.screenHeight! * 0.03),
        child: Text(
          label,
          style:
              TextStyle(color: Colors.grey, fontSize: SizeConfig.screenHeight! * 0.023, fontWeight: FontWeight.normal),
        ));
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
