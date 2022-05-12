import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    final formVm = Provider.of<FormsVm>(context,listen:false);
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.1,
          vertical: SizeConfig.screenHeight! * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Loan Form",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.screenWidth! * 0.03),
            RoundedInputField(
              hintText: "amount",
              icon: Icons.person,
              onChanged: (value) {
                setState(() {
                  amount =int.parse(value);
                });
              },
            ),
            RoundedInputField(
              hintText: "time",
              icon: Icons.person,
              onChanged: (value) {
                setState(() {
                  time =int.parse(value);
                });
              },
            ),
            RoundedButton(
              text: "Calculate",
              onTap: () {
                formVm.amount = amount;
                formVm.time = time;
                formVm.calculateMonthlyRate();
                print('loan per month is ${formVm.loanAmount}');

                // Navigator.pushNamed(context, PersonalDataForm.routeName);
              },
              color: Colors.grey,
              textColor: AppColors.kWhiteColor,
            ),
            SizedBox(height: SizeConfig.screenWidth! * 0.03),
          ],
        ),
      ),
    );
  }
}
