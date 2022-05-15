import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
import 'package:rns_flutter_task/constants/app_strings.dart';
import 'package:rns_flutter_task/custom_widgets/custom_dialoge.dart';
import 'package:rns_flutter_task/custom_widgets/rounded_button.dart';
import 'package:rns_flutter_task/custom_widgets/rounded_input_field.dart';
import 'package:rns_flutter_task/utilities/connectivity_utilities.dart';
import 'package:rns_flutter_task/views/Forms/forms_vm.dart';

class PersonalDataForm extends StatefulWidget {
  static const routeName = 'personalDataForm';

  const PersonalDataForm({Key? key}) : super(key: key);

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController monthlyIcomController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // int _radioValue = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    jobTitleController.dispose();
    monthlyIcomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<FormsVm>(
      builder: (context, formVm, _) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: SizeConfig.screenHeight! * 0.8,
                width: SizeConfig.screenWidth! * 0.84,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.04,
                        ),
                        Center(
                          child: Text(
                            AppStrings.personalDataForm,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.screenHeight! * 0.025),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.04,
                        ),
                        customLabel(AppStrings.firstName),
                        formTextField(
                            hintText: 'Enter First Name',
                            onChange: (val) {},
                            controller: firstNameController),
                        customLabel(AppStrings.lastName),
                        formTextField(
                            hintText: 'Enter Last Name',
                            onChange: (val) {},
                            controller: lastNameController),
                        customLabel(AppStrings.occupationalStatus),
                        jobstatus(formVm),
                        formVm.jobStatus
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customLabel(AppStrings.jobTitle),
                                  formTextField(
                                      hintText: 'Enter Job Title',
                                      onChange: (val) {},
                                      controller: jobTitleController),
                                ],
                              )
                            : SizedBox(
                                height: SizeConfig.screenHeight! * 0.01,
                              ),
                        customLabel(AppStrings.monthlyIncom),
                        formTextField(
                            hintText: 'Enter MonthlyIncome',
                            onChange: (val) {},
                            controller: lastNameController),
                        customLabel(AppStrings.invoicePicture),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                        formVm.imageFileStatus
                            ? Container(
                                height: SizeConfig.screenHeight! * 0.1,
                                width: SizeConfig.screenWidth! * 0.4,
                                child: Image.file(
                                  formVm.imageFile,
                                  fit: BoxFit.contain,
                                ))
                            : CustomFormButton(
                                text: "Upload",
                                onTap: () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) => const CustomDialoge(),
                                  );
                                },
                                color: AppColors.kLightGreySlideToolTipColor,
                                textColor: AppColors.kWhiteColor,
                                height: SizeConfig.screenHeight! * 0.035,
                                width: SizeConfig.screenWidth! * 0.27,
                              ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.03,
                        ),
                        CustomFormButton(
                          text: "Submit",
                          onTap: () {
                            if(_formKey.currentState!.validate()){

                            }
                            print('image path is ${formVm.imageFile.path}');
                            // Navigator.pushNamed(context, LogInScreen.routeName);
                            // print('amount selected is ${formVm.amount}');
                            // print('time Period  is ${formVm.timePeriod}');
                            print('job status is ${formVm.jobStatus}');
                            // print('monthlyRate is ${formVm.monthlyRate}');
                          },
                          color: AppColors.kLightGreySlideToolTipColor,
                          textColor: AppColors.kWhiteColor,
                          height: SizeConfig.screenHeight! * 0.07,
                          width: SizeConfig.screenWidth! * 0.7,
                        ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.screenHeight! * 0.01,
      ),
      child: Text(
        label,
        style: TextStyle(
            color: AppColors.kBlackColor,
            fontSize: SizeConfig.screenHeight! * 0.023,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  // Widget formLabelText({required String text}) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //       top: SizeConfig.screenHeight! * 0.01,
  //     ),
  //     child: Text(
  //       text,
  //       style: const TextStyle(
  //         fontSize: 16,
  //         color: AppColors.kTextColorGrey,
  //       ),
  //     ),
  //   );
  // }

  Widget formTextField(
      {required String hintText,
      var onChange,
      required TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.screenHeight! * 0.01,
          // left: SizeConfig.screenHeight! * 0.03,
          right: SizeConfig.screenWidth! * 0.042),
      child: TextFormField(
        controller: controller,
        // onTap: onTap,
        onChanged: onChange,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter value';
            } else {
              return 'name recorded';
            }
          },
        decoration: InputDecoration(
          // suffixIcon: Padding(
          //     padding: EdgeInsets.all(12.0),
          //     child: Icon(
          //       icon,
          //     )),
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),

        ),

      ),
    );
  }

  Widget jobstatus(FormsVm formsVm) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Radio(
            value: 0,
            groupValue: formsVm.jobStatusBtnValue,
            onChanged: _handleRadioValueChange,
          ),
          Text(
            'Employed',
            style: TextStyle(fontSize: SizeConfig.screenHeight! * 0.016),
          ),
          Radio(
            value: 1,
            groupValue: formsVm.jobStatusBtnValue,
            onChanged: _handleRadioValueChange,
          ),
          Text(
            'Non Employee',
            style: TextStyle(
              fontSize: SizeConfig.screenHeight! * 0.016,
            ),
          ),
        ]);
  }

  void _handleRadioValueChange(int? value) {
    final formsVm = Provider.of<FormsVm>(context, listen: false);
    formsVm.jobStatusBtnValue = value!;

    switch (formsVm.jobStatusBtnValue) {
      case 0:
        formsVm.jobStatus = true;
        break;
      case 1:
        formsVm.jobStatus = false;
        break;
    }
    // setState(() {
    //
    // });
  }
}
