import 'dart:io';

import 'package:intl/intl.dart';
import 'package:news_mobile/core/utils/enums.dart';

extension StringExtension on String {
  String toCapitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String currency(String? currency) {
    final format = NumberFormat.simpleCurrency(
      locale: Platform.localeName,
      name: currency,
    );
    return format.format(this);
  }
}

extension DateTimeExtension on DateTime {
  String get toWeekDayDayMonth {
    final day = '${this.day}';
    final weekDay = DateFormat('EEEE').format(this);
    final month = Month.values[this.month - 1].name.toCapitalize();
    return '$weekDay, $day $month';
  }

  String get toMonthDayYear {
    final month = MonthAbbr.values[this.month - 1].name.toCapitalize();
    return '$month $day, $year';
  }

  String get toWeekDayAbbrMonthAbbrDayYear {
    final weekDay = DateFormat('EE').format(this);
    final month = MonthAbbr.values[this.month - 1].name.toCapitalize();
    return '$weekDay, $month $day, $year';
  }
}
