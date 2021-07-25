import 'package:intl/intl.dart';

String hyphenedDates(DateTime date) {
  DateFormat format = DateFormat('y-MM-d');
  return format.format(date);
}

String displayDatesFormat(DateTime date) {
  return DateFormat.yMMMd('en_us').format(date);
}
