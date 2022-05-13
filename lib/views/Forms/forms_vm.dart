
import 'package:rns_flutter_task/data/base/base_vm.dart';

class FormsVm extends BaseVm {
  double _amount = 100;
  double  _loanAmount =0.0;

  double get loanAmount => _loanAmount;

  set loanAmount(double value) {
    _loanAmount = value;
  }

  int get time => _time;

  set time(int value) {
    _time = value;
  }
  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  int _time =0;


   calculateMonthlyRate() {
     double intrestpermonth = amount*0.01/time;
     loanAmount= (amount/time)+intrestpermonth;

    // _coinDetail.amountInCart = _coinDetail.amountInCart = 1;

    notifyListeners();
  }


}
