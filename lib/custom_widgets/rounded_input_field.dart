import 'package:flutter/material.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
import 'package:rns_flutter_task/custom_widgets/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  var onChanged;
   RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
