import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rns_flutter_task/views/Forms/personal_data_form.dart';
import 'package:rns_flutter_task/views/Forms/loan_form.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoanForm.routeName:
      return MaterialPageRoute(builder: (context) => const LoanForm ());
    case PersonalDataForm.routeName:
      return MaterialPageRoute(builder: (context) => const PersonalDataForm ());
    // case LogInScreen.routeName:
    //   return MaterialPageRoute(builder: (context) => const LogInScreen());


    default:
      return errorRoute();
  }
}

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Arggg!'),
        ),
        body: const Center(
          child: Text('Oh No! You should not be here! '),
        ),
      );
    },
  );
}
