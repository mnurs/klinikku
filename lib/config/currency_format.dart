import 'package:intl/intl.dart';

class FormatCurrency{
  static Currency(String number){
    return NumberFormat.simpleCurrency(name: "", decimalDigits: 0).format(double.parse(number));
  }
}