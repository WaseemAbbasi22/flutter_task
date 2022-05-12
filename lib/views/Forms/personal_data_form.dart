import 'package:flutter/material.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
import 'package:rns_flutter_task/custom_widgets/rounded_button.dart';
import 'package:rns_flutter_task/custom_widgets/rounded_input_field.dart';

class PersonalDataForm extends StatefulWidget {
  static const routeName = 'personalDataForm';

  const PersonalDataForm({Key? key}) : super(key: key);

  @override
  State<PersonalDataForm> createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.1,
          vertical: SizeConfig.screenHeight! * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
            formLabelText(text: 'First Name'),
            RoundedInputField(
              hintText: "First Name",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Last Name",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            //  Radio(
            //   value: 1,
            //   onChanged:,
            //    groupValue: null,
            // ),
            formLabelText(text: 'Job Title'),
            RoundedInputField(
              hintText: "Job Title",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Submit",
              onTap: () {},
              color: Colors.grey,
              textColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.03),
          ],
        ),
      ),
    );
  }

  Widget formLabelText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.kTextColorGrey,
      ),
    );
  }
}
