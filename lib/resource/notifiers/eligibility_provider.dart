import 'package:flutter/cupertino.dart';

class EligibilityScreenProvider extends ChangeNotifier {
  String _eligibilityMessage = "";
  bool? _isEligible;
  bool? _isLoading = false;

  setLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  void checkEligibility(int age) {
    setLoading(true);
    Future.delayed(const Duration(milliseconds: 1500), () {
      setLoading(false);
      if (age >= 18) {
        eligibleForLicense();
      } else {
        notEligibleForLicense();
      }
    });
  }

  eligibleForLicense() {
    _isEligible = true;
    _eligibilityMessage = "You are eligible for driving license";
    notifyListeners();
  }

  notEligibleForLicense() {
    _isEligible = false;
    _eligibilityMessage = "Sorry! you are not eligible for driving license";
    notifyListeners();
  }

  String get eligibilityMessage => _eligibilityMessage;

  bool? get isEligible => _isEligible;

  bool? get isLoading => _isLoading;
}
