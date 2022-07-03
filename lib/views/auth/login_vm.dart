import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_task/data/base/base_vm.dart';
import 'package:flutter_task/data/extentions.dart';
import 'package:flutter_task/data/services/web_services.dart';
import 'package:flutter_task/utilities/general_utilities.dart';

import '../../data/models/validation_model.dart';

class LoginVm extends BaseVm {
  bool _loading = false;
  bool _detectBtnClick = false;
  bool _isObscure = false;

  bool get isObscure => _isObscure;

  set isObscure(bool value) {
    _isObscure = value;
    notifyListeners();
  }

  bool get detectBtnClick => _detectBtnClick;

  set detectBtnClick(bool value) {
    _detectBtnClick = value;
    notifyListeners();
  }
  
  ValidationModel _userName = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  ValidationModel get userName => _userName;

  set userName(ValidationModel value) {
    _userName = value;
    notifyListeners();
  }

  ValidationModel get password => _password;

  set password(ValidationModel value) {
    _password = value;
    notifyListeners();
  }
  
  

  void validateUserName(String? val) {
    if (val != null && val.isValidName) {
      userName = ValidationModel(val, null);
    } else {
      userName = ValidationModel(null, 'Please Enter a Valid User Name');
    }
    notifyListeners();
  }

  void validatePassword(String? val) {
    if (val != null && val.isValidPassword) {
      password = ValidationModel(val, null);
      print('I am in if Condition with firstName value ${password.value} ');
    } else {
      password = ValidationModel(null, 'Please Enter a Valid password (only Numbers)');
    }
    notifyListeners();
  }


  bool get validate {
    return _userName.value != null;
  }


  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> logIn(BuildContext context) async {
     await WebService.fetchRandomNumbersFromApis(context);
  }
}
