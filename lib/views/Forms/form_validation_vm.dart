import 'package:flutter_task/data/base/base_vm.dart';
import 'package:flutter_task/data/extentions.dart';
import 'package:flutter_task/data/models/validation_model.dart';

class FormValidationVm extends BaseVm{
  ValidationModel _firstName = ValidationModel(null, null);

  ValidationModel get firstName => _firstName;

  set firstName(ValidationModel value) {
    _firstName = value;
    notifyListeners();

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
    if (val != null && val.isValidUserName) {
      firstName = ValidationModel(val, null);
    } else {
      firstName = ValidationModel(null, 'Please Enter a Valid Name');
    }
    notifyListeners();
  }
  void validateLastName(String? val) {
    if (val != null && val.isValidUserName) {
      lastName = ValidationModel(val, null);
    } else {
      lastName = ValidationModel(null, 'Please Enter a Valid Name');
    }
    notifyListeners();
  }
  void validateIncome(String? val) {
    if (val != null && val.isValidIncome) {
      monthlyIncome = ValidationModel(val, null);
    } else {
      monthlyIncome = ValidationModel(null, 'Please Enter a Valid Income');
    }
    notifyListeners();
  }
  void validateJobTitle(String? val) {
    if (val != null && val.isValidTitle) {
      jobTitle = ValidationModel(val, null);
    } else {
      jobTitle = ValidationModel(null, 'Please Enter a Valid Income');
    }
    notifyListeners();
  }
  bool get validate {
    return firstName.value != null &&
        lastName.value != null &&
        monthlyIncome.value != null &&
        invoicePicture.value != null;
  }

}