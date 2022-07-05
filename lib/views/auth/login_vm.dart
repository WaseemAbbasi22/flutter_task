import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_task/data/models/post_model.dart';
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
  String _logInStatus = '';

  String get logInStatus => _logInStatus;

  set logInStatus(String value) {
    _logInStatus = value;
    notifyListeners();
  }

  bool get isObscure => _isObscure;
  List<Post> _postList= [];

  List<Post> get postList => _postList;

  set postList(List<Post> value) {
    _postList = value;
    notifyListeners();
  }

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
    if (val != null && val.isValidUserName) {
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
    try {
      loading = true;
      var data = {
          // "email": "hassan.zafar@ropstam.com",
          // "password": "12345678",
          "email": userName.value,
          "password": password.value,
          "device_token": "zasdcvgtghnkiuhgfde345tewasdfghjkm"

      };
      print('body I am sending ...$data');
      var response = await WebService.post('login', data);
      if (response.statusCode == 200) {
        print("Success");
        var data = response.data;
        loading = false;
        logInStatus = response.data['meta']['message'];
        print('meta message value is $logInStatus');

        print('looged with data: $data');
      }
    } catch (e) {
      loading = false;
      GeneralUtilities.showMessage(
          context: context,
          title: "Error",
          text:
          "Server Error");

      print(e);
    }
  }

  Future getPosts(BuildContext context) async {
    try{
      loading = true;

      var url = "Posts";

      var resp = await WebService.get(url);
      if (resp.statusCode == 200) {
        print('In success status condition...');
        // print('response is ${ resp.data['payload']}');
        postList =  List<Post>.from(resp.data
            .map((e) => Post.fromJson(e)));
        loading = false;
        print('value of loader in controller  is ${loading}');
        print('post list length is ${postList.length}');
      } else {
        loading = false;
        print("error is ${resp.statusCode}");
      }
    }catch(e){
      loading= false;
      GeneralUtilities.showMessage(
          context: context,
          title: "Error",
          text:
          "Server Error");

    }
  }
}
