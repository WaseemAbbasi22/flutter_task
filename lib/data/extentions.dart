extension extString on String {


  bool get isValidName{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidTitle{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }
  bool get isValidInvoice{
    final nameRegExp = new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isNotNull{
    return this!=null;
  }

  bool get isValidIncome{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
  // bool get isValidPicture{
  //   final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
  //   return phoneRegExp.hasMatch(this);
  // }

}