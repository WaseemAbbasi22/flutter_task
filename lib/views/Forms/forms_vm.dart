
import 'package:rns_flutter_task/data/base/base_vm.dart';

class FormsVm extends BaseVm {
  int _amount = 0;
  double  _loanAmount =0.0;

  double get loanAmount => _loanAmount;

  set loanAmount(double value) {
    _loanAmount = value;
  }

  int get time => _time;

  set time(int value) {
    _time = value;
  }
  int get amount => _amount;

  set amount(int value) {
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
