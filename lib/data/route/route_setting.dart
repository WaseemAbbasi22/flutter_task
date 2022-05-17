import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rns_flutter_task/views/Forms/personal_data_form.dart';
import 'package:rns_flutter_task/views/Forms/loan_form.dart';
import 'package:rns_flutter_task/views/loan_status_view.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoanForm.routeName:
      return MaterialPageRoute(builder: (context) => const LoanForm ());
    case PersonalDataForm.routeName:
      return MaterialPageRoute(builder: (context) => const PersonalDataForm ());
    case LoanStatusView.routeName:
      return MaterialPageRoute(builder: (context) => const LoanStatusView ());

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
