import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_task/views/auth/login_view.dart';
import 'package:flutter_task/views/auth/login_vm.dart';
import 'package:provider/provider.dart';
import 'package:flutter_task/views/Forms/forms_vm.dart';
import 'package:flutter_task/views/Forms/loan_form.dart';

import 'data/route/route_setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => FormsVm()),
          ChangeNotifierProvider(create: (_) => LoginVm()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LogInView.routeName,
          onGenerateRoute: (settings) => generateRoute(settings),
          builder: EasyLoading.init(),
        ));
  }
}
