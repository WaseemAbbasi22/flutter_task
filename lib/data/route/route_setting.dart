import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_task/views/Forms/login_view.dart';
import 'package:flutter_task/views/Forms/loan_form.dart';
import 'package:flutter_task/views/auth/login_view.dart';
import 'package:flutter_task/views/home/home_view.dart';
import 'package:flutter_task/views/loan_status_view.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoanForm.routeName:
      return MaterialPageRoute(builder: (context) => const LoanForm ());
      case LogInView.routeName:
      return MaterialPageRoute(builder: (context) => const LogInView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
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
