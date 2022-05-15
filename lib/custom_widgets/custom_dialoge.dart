import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';
import 'package:rns_flutter_task/constants/app_colors.dart';
import 'package:rns_flutter_task/views/Forms/forms_vm.dart';

class CustomDialoge extends StatelessWidget {
  const CustomDialoge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formVm = Provider.of<FormsVm>(context,listen: false);
    return AlertDialog(
      title: const Text(
        "Chose Medium",
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: SizeConfig.screenHeight! * 0.02),
      actionsOverflowButtonSpacing: SizeConfig.screenHeight! * 0.02,
      // actions: [
      //   ElevatedButton(onPressed: () {}, child: Text("Back")),
      //   ElevatedButton(onPressed: () {}, child: Text("Next")),
      // ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              formVm.getFromGallery();
              Navigator.pop(context);
            },
            child: const Text("Gallery"),
            style: ElevatedButton.styleFrom(
              primary: AppColors.kLightGreySlideToolTipColor,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              formVm.getFromCamera();
              Navigator.pop(context);
            },
            child: const Text("Camera"),
            style: ElevatedButton.styleFrom(
              primary: AppColors.kLightGreySlideToolTipColor,
            ),
          ),
        ],
      ),
    );
  }
}
