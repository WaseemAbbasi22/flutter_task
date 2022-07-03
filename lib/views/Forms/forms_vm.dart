import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_task/data/base/base_vm.dart';
import 'package:flutter_task/data/extentions.dart';
import 'package:flutter_task/data/services/web_services.dart';
import 'package:flutter_task/utilities/general_utilities.dart';

import '../../data/models/validation_model.dart';

class FormsVm extends BaseVm {
  double _monthlyRate = 0.0;
  double _amount = 100;
  bool _loading = false;
  File? _imageFile;
  bool _jobStatus = false;
  bool _imageFileStatus = false;
  bool _detectBtnClick = false;

  bool get detectBtnClick => _detectBtnClick;

  set detectBtnClick(bool value) {
    _detectBtnClick = value;
    notifyListeners();
  }

  ValidationModel _firstName = ValidationModel(null, null);
  int _randomNumber = 0;

  String _loanStatus = '';

  String get loanStatus => _loanStatus;

  set loanStatus(String value) {
    _loanStatus = value;
    notifyListeners();
  }

  int get randomNumber => _randomNumber;

  set randomNumber(int value) {
    _randomNumber = value;
    notifyListeners();
  }

  ValidationModel get firstName => _firstName;

  set firstName(ValidationModel value) {
    _firstName = value;
  }

  ValidationModel _lastName = ValidationModel(null, null);
  ValidationModel _monthlyIncome = ValidationModel(null, null);
  ValidationModel _invoicePicture = ValidationModel(null, null);
  ValidationModel _jobTitle = ValidationModel(null, null);

  ValidationModel get lastName => _lastName;

  set lastName(ValidationModel value) {
    _lastName = value;
    notifyListeners();
  }

  ValidationModel get monthlyIncome => _monthlyIncome;

  set monthlyIncome(ValidationModel value) {
    _monthlyIncome = value;
    notifyListeners();
  }

  ValidationModel get invoicePicture => _invoicePicture;

  set invoicePicture(ValidationModel value) {
    _invoicePicture = value;
    notifyListeners();
  }

  ValidationModel get jobTitle => _jobTitle;

  set jobTitle(ValidationModel value) {
    _jobTitle = value;
    notifyListeners();
  }

  void validateFirstName(String? val) {
    print('value for the view is $val');
    if (val != null && val.isValidName) {
      firstName = ValidationModel(val, null);
    } else {
      firstName = ValidationModel(null, 'Please Enter a Valid First Name');
    }
    notifyListeners();
  }

  void validateLastName(String? val) {
    if (val != null && val.isValidName) {
      lastName = ValidationModel(val, null);
    } else {
      lastName = ValidationModel(null, 'Please Enter a Valid Last Name');
    }
    notifyListeners();
  }

  void validateIncome(String? val) {
    if (val != null && val.isValidIncome) {
      monthlyIncome = ValidationModel(val, null);
      print('I am in if Condition with firstName value ${monthlyIncome.value} ');
    } else {
      monthlyIncome = ValidationModel(null, 'Please Enter a Valid Income (only Numbers)');
      print('I am in else Condition with firstName value ${firstName.error} ');
      print('reg expression match value is ${val?.isValidName}');
    }
    notifyListeners();
  }

  void validateJobTitle(String? val) {
    if (val != null && val.isValidTitle) {
      jobTitle = ValidationModel(val, null);
    } else {
      jobTitle = ValidationModel(null, 'Please Enter a Valid Job Title');
    }
    notifyListeners();
  }

  bool get validate {
    return lastName.value != null;
  }

  bool get imageFileStatus => _imageFileStatus;

  set imageFileStatus(bool value) {
    _imageFileStatus = value;
    notifyListeners();
  }

  int _jobStatusBtnValue = 1;

  int get jobStatusBtnValue => _jobStatusBtnValue;

  set jobStatusBtnValue(int value) {
    _jobStatusBtnValue = value;
    notifyListeners();
  }

  bool get jobStatus => _jobStatus;

  set jobStatus(bool value) {
    _jobStatus = value;
    notifyListeners();
  }

  File get imageFile => _imageFile!;

  set imageFile(File value) {
    _imageFile = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String _timePeriod = "1 Month";

  String get timePeriod => _timePeriod;

  set timePeriod(String value) {
    _timePeriod = value;
    notifyListeners();
  }

  double get monthlyRate => _monthlyRate;

  set monthlyRate(double value) {
    _monthlyRate = value;
    notifyListeners();
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
    notifyListeners();
  }

  calculateMonthlyRate() {
    loading = true;
    Future.delayed(Duration(seconds: 2)).whenComplete(() {
      double intrestpermonth = amount * 0.01 * GeneralUtilities.stringConversion(timePeriod);
      monthlyRate = (amount / GeneralUtilities.stringConversion(timePeriod)) + intrestpermonth;
      loading = false;
    });

    notifyListeners();
  }

  /// Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      imageFileStatus = true;
    }
  }

  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 200,
      maxHeight: 200,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      imageFileStatus = true;
    }
  }

  Future<void> getRandomNumberFromApi(BuildContext context) async {
    randomNumber = await WebService.fetchRandomNumbersFromApis(context);
  }

  getLoanStatus() {
    if (randomNumber >= 0 && randomNumber <= 5) {
      loanStatus = 'Not Eligible';
    } else if (randomNumber > 5 && randomNumber <= 10) {
      loanStatus = 'Eligible';
    }
    notifyListeners();
  }
}
