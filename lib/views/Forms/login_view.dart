import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task/configurations/size_config.dart';
import 'package:flutter_task/constants/app_colors.dart';
import 'package:flutter_task/constants/app_strings.dart';
import 'package:flutter_task/custom_widgets/custom_dialoge.dart';
import 'package:flutter_task/custom_widgets/rounded_button.dart';
import 'package:flutter_task/custom_widgets/rounded_input_field.dart';
import 'package:flutter_task/utilities/connectivity_utilities.dart';
import 'package:flutter_task/utilities/general_utilities.dart';
import 'package:flutter_task/views/Forms/forms_vm.dart';
import 'package:flutter_task/views/loan_status_view.dart';

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
  void clearControllerValue() {
    // TODO: implement dispose
    firstNameController.clear();
    lastNameController.clear();
    jobTitleController.clear();
    monthlyIcomController.clear();
    super.dispose();
  }

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
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: SizeConfig.screenHeight! * 0.12,
              //   ),
              //   child: Row(
              //     children: [
              //       SvgPicture.asset("assets/images/App-icon.svg"),
              //       SizedBox(
              //         width: SizeConfig.screenWidth! * 0.03,
              //       ),
              //       Text(
              //         AppStrings.appTitle,
              //         style: TextStyle(
              //             color: AppColors.kTextColorGrey,
              //             fontWeight: FontWeight.bold,
              //             fontSize: SizeConfig.screenHeight! * 0.025),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Container(
                padding: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.07),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                        // CustomFormField(
                        //   hintText: 'First Name',
                        //   controller: firstNameController,
                        //   errorText: formVm.firstName.error,
                        //   // onChanged: (val) {
                        //   //   formVm.validateFirstName(val);
                        //   // },
                        // ),
                        customLabel(AppStrings.lastName),
                        // CustomFormField(
                        //   hintText: 'Last Name',
                        //   // onChanged: formVm.validateLastName,
                        //   controller: lastNameController,
                        //   errorText: formVm.lastName.error,
                        // ),
                        // formTextField(
                        //     hintText: 'Enter Last Name',
                        //     onChange: (val) {},
                        //     controller: lastNameController),
                        customLabel(AppStrings.occupationalStatus),
                        jobstatus(formVm),
                        formVm.jobStatus
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customLabel(AppStrings.jobTitle),
                                  // CustomFormField(
                                  //   hintText: 'Job Title',
                                  //
                                  //   // onChanged: formVm.validateLastName,
                                  //   controller: jobTitleController,
                                  //   errorText: formVm.jobTitle.error,
                                  // ),
                                ],
                              )
                            : SizedBox(
                                height: SizeConfig.screenHeight! * 0.01,
                              ),
                        customLabel(AppStrings.monthlyIncom),
                        // CustomFormField(
                        //   hintText: 'Monthly Income',
                        //   controller: monthlyIcomController,
                        //   errorText: formVm.monthlyIncome.error,
                        // ),
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
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFormButton(
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
                                  formVm.detectBtnClick
                                      ? const Text(
                                          'Please Upload Invoice Picture',
                                          style: TextStyle(color: Colors.red),
                                        )
                                      : const SizedBox(
                                          height: 2.0,
                                        ),
                                ],
                              ),
                        SizedBox(
                          height: SizeConfig.screenHeight! * 0.03,
                        ),
                        CustomFormButton(
                          text: "Submit",
                          onTap: () {
                            formVm.detectBtnClick = true;
                            formVm.validateFirstName(firstNameController.text);
                            formVm.validateLastName(lastNameController.text);
                            formVm.validateIncome(monthlyIcomController.text);
                            if (formVm.jobStatus) {
                              formVm.validateJobTitle(jobTitleController.text);
                            }
                            if (formVm.imageFileStatus &&
                                formVm.firstName.value != null &&
                                formVm.lastName.value != null &&
                                formVm.monthlyIncome.value != null) {
                              EasyLoading.show();
                              formVm.getRandomNumberFromApi(context).whenComplete(() {
                                clearControllerValue();
                                formVm.imageFileStatus =false;
                                formVm.getLoanStatus();
                                EasyLoading.dismiss();
                                formVm.detectBtnClick = false;
                                Navigator.pushReplacementNamed(context, HomeView.routeName);
                              });
                            } else {
                              GeneralUtilities.showMessage(
                                  context: context, title: "Error", text: "Please provide required information.");
                            }
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
            color: AppColors.kBlackColor, fontSize: SizeConfig.screenHeight! * 0.023, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget jobstatus(FormsVm formsVm) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
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
