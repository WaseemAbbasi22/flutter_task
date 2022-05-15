import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rns_flutter_task/data/base/base_vm.dart';
import 'package:rns_flutter_task/utilities/general_utilities.dart';

class FormsVm extends BaseVm {
  double _monthlyRate = 0.0;
  double _amount = 100;
  bool _loading = false;
  File? _imageFile;
  bool _jobStatus = false;
  bool _imageFileStatus = false;

  bool get imageFileStatus => _imageFileStatus;

  set imageFileStatus(bool value) {
    _imageFileStatus = value;
    notifyListeners();
  }

  int _jobStatusBtnValue = 0;


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
      double intrestpermonth =
          amount * 0.01 * GeneralUtilities.stringConversion(timePeriod);
      monthlyRate = (amount / GeneralUtilities.stringConversion(timePeriod)) +
          intrestpermonth;
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
}
