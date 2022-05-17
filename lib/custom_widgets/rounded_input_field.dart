import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hintText,
    required this.errorText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.01, right: SizeConfig.screenWidth! * 0.042),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
