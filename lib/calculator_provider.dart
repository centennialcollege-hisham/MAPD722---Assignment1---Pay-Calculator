import 'package:flutter/cupertino.dart';

class CalculatorProvider extends ChangeNotifier {
  int numbersOfHour = -1;
  double hourlyRate = -1;
  double regularPay = 0.0;
  double overtimePay = 0.0;
  double tax = 0.0;
  double totalPay = 0.0;
  bool isNumberOfHoursEmpty = false;
  bool isHourlyRateEmpty = false;

  calculate() {
    if (numbersOfHour == -1) {
      isNumberOfHoursEmpty = true;
    }
    if (hourlyRate == -1) {
      isHourlyRateEmpty = true;
    }

    if (isNumberOfHoursEmpty || isHourlyRateEmpty) {
      notifyListeners();
      return;
    }

    if (numbersOfHour <= 40) {
      regularPay = numbersOfHour * hourlyRate;
      overtimePay = 0;
    } else {
      regularPay = 40 * hourlyRate;
      overtimePay = (numbersOfHour - 40) * hourlyRate * 1.5;
    }
    totalPay = regularPay + overtimePay;
    tax = totalPay * 0.18;
    notifyListeners();
  }

  onChangeNumbersOfHour(String value) {
    isNumberOfHoursEmpty = _validateNumbersOfHour(value);
    numbersOfHour = isNumberOfHoursEmpty ? 0 : int.parse(value);
    notifyListeners();
  }

  onChangeHourlyRate(String value) {
    isHourlyRateEmpty = _validateHourlyRate(value);
    hourlyRate = isHourlyRateEmpty ? 0.0 : double.parse(value);
    notifyListeners();
  }

  bool _validateNumbersOfHour(String? value) {
    return value == null || value.isEmpty;
  }

  bool _validateHourlyRate(String? value) {
    return value == null || value.isEmpty;
  }
}
