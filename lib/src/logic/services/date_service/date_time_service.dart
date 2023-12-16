import 'package:intl/intl.dart';

import '../../../utils/enums/enums.dart';

class DateTimeService {
  // Method to convert date to predefined formats
  String convertToPredefinedFormat(DateTime date, PredefinedDateFormat format) {
    switch (format) {
      case PredefinedDateFormat.dateOnly:
        return DateFormat('yyyy-MM-dd')
            .format(date); // Change the format as needed
      case PredefinedDateFormat.timeOnly:
        return DateFormat('HH:mm:ss')
            .format(date); // Change the format as needed
      case PredefinedDateFormat.dateTime:
        return DateFormat('yyyy-MM-dd HH:mm:ss')
            .format(date); // Change the format as needed
      case PredefinedDateFormat.time12HourFormat:
        return DateFormat('hh:mma')
            .format(date); // Format for 12-hour time with AM/PM
      case PredefinedDateFormat.time24HourFormat:
        return DateFormat('HH:mm').format(date); // Format for 24-hour time

      default:
        throw Exception("Invalid date format");
    }
  }

  // Method to convert date to custom format using intl package
  String convertToCustomFormat(DateTime date, String customFormat) {
    return DateFormat(customFormat).format(date);
  }
}
