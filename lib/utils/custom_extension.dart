
import 'package:intl/intl.dart';

import '../app.export.dart';

//String Extension...
extension StringExtension on String? {
  // Remove Special character from string...
  String? get removeSpecialCharacters =>
      this?.trim().replaceAll(RegExp(r'[^A-Za-z0-9]'), '');

  // Process String...
  List<TextSpan>? processCaption({
    String matcher = "#",
    TextStyle? fancyTextStyle,
    TextStyle? normalTextStyle,
    Function? onTap,
  }) {
    return this
        ?.split(' ')
        .map(
          (text) => TextSpan(
            text: (text.toString().contains(matcher)
                    ? text.replaceAll(matcher, "")
                    : text) +
                ' ',
            style: text.toString().contains(matcher)
                ? fancyTextStyle
                : normalTextStyle,
            recognizer: text.toString().contains(matcher)
                ? onTap == null
                    ? null
                    : (TapGestureRecognizer()
                      ..onTap = onTap as GestureTapCallback?)
                : null,
          ),
        )
        .toList();
  }

  String get toFirstLetter {
    String temp = "";
    List<String> splittedWords =
        (this?.isEmpty ?? true) ? [] : this?.split(" ") ?? [];

    splittedWords.removeWhere((word) => word.isEmpty);

    if (splittedWords.length == 1) {
      temp = splittedWords[0][0].toUpperCase();
    } else if (splittedWords.length == 2) {
      temp =
          splittedWords[0][0].toUpperCase() + splittedWords[1][0].toUpperCase();
    }

    return temp;
  }

  //Format Date with Required Format...
  String? toDateFormat({
    String incommingDateFormate = "MM/dd/yyyy HH:mm",
    String requiredFormat = "dd MMM, yyyy",
  }) {
    if (this?.isEmpty ?? true) return this;

    DateFormat dateFormat = DateFormat(incommingDateFormate);
    try {
      return DateFormat(requiredFormat)
          .format(dateFormat.parse(this!, true).toLocal());
    } catch (error) {
      print(
          "Please check incomming date format, format should be $incommingDateFormate:- $error");
      return this;
    }
  }

  //Decode JWT Token...
  Map<String, dynamic> get getJsonFromJWT {
    try {
      if (this?.trim().isEmpty ?? true) {
        return {"exp": "0"};
      } else {
        String normalizedSource = base64Url.normalize(this!.split(".")[1]);
        return json.decode(
          utf8.decode(
            base64Url.decode(normalizedSource),
          ),
        );
      }
    } catch (error) {
      print("Error converting token data, $error");
      return {"exp": "0"};
    }
  }
}

// Convert Date...
extension DateConversion on DateTime {
  // To Server Date...
  DateTime get toUTCTimeZone =>
      DateTime.parse(DateFormat('yyyy-MM-dd HH:mm:ss').format(this));

  // To Date Format...
  String dateFormat({
    String requiredFormat = "dd/MM/yyyy",
  }) =>
      DateFormat(requiredFormat).format(this);
}

extension DynamicExtension on dynamic {
  bool get isNullorEmpty => this == null || (this?.isEmpty ?? false);
}
