import '../app.export.dart';

class TextFieldDecoration {
  static BorderRadius get textBorderRadius => BorderRadius.circular(10);
  static Color get borderColor => custBlack;
  static Color get unFocuseborderColor => Colors.black.withOpacity(0.1);
  static double get borderWidth => 1;

  // Outline border...
  static InputDecorationTheme get getOutLineInputDecoration =>
      InputDecorationTheme(
        filled: true,
        errorMaxLines: 2,
        fillColor: custGrey,
        hintStyle: TextStyleDecoration.textStyle,
        errorStyle: const TextStyle(
          fontFamily: TextStyleDecoration.fontFamily,
          color: Colors.red,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: _focusedErrorBorder,
        errorBorder: _errorBorder,
        focusedBorder: _focusedBorder,
        border: _border,
        enabledBorder: _enabledBorder,
        disabledBorder: _disabledBorder,
        contentPadding: const EdgeInsets.all(20),
      );

  static final OutlineInputBorder _border = OutlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: borderWidth,
    ),
  );

  static final OutlineInputBorder _enabledBorder = OutlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: unFocuseborderColor,
      width: borderWidth,
    ),
  );

  static final OutlineInputBorder _disabledBorder = OutlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: borderColor,
      width: borderWidth,
    ),
  );

  static final OutlineInputBorder _focusedBorder = OutlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: borderColor,
      width: borderWidth,
    ),
  );

  static final OutlineInputBorder _errorBorder = OutlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: Colors.red,
      width: borderWidth,
    ),
  );

  static final OutlineInputBorder _focusedErrorBorder = OutlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: Colors.red,
      width: borderWidth,
    ),
  );

  // UnderLine border...
  static InputDecorationTheme get getUnderLineInputDecoration =>
      InputDecorationTheme(
        filled: true,
        errorMaxLines: 2,
        fillColor: Colors.transparent,
        focusColor: Colors.transparent,
        hintStyle: TextStyleDecoration.textfieldPlaceholder,
        errorStyle: const TextStyle(
          fontFamily: TextStyleDecoration.fontFamily,
          color: Colors.red,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        focusedErrorBorder: _underLineFocusedErrorBorder,
        errorBorder: _underLineErrorBorder,
        focusedBorder: _underLineFocusedBorder,
        border: _underLineBorder,
        enabledBorder: _underLineEnabledBorder,
        disabledBorder: _underLineDisabledBorder,
        contentPadding:
            const EdgeInsets.all(20), // use to set textfield height...
      );

  static final UnderlineInputBorder _underLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(
      color: borderColor,
      width: borderWidth,
    ),
  );

  static final UnderlineInputBorder _underLineEnabledBorder =
      UnderlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: borderColor,
      width: borderWidth,
    ),
  );

  static final UnderlineInputBorder _underLineDisabledBorder =
      UnderlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: borderColor,
      width: borderWidth,
    ),
  );

  static final UnderlineInputBorder _underLineFocusedBorder =
      UnderlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: Colors.black45,
      width: borderWidth,
    ),
  );

  static final UnderlineInputBorder _underLineErrorBorder =
      UnderlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: Colors.red,
      width: borderWidth,
    ),
  );

  static final UnderlineInputBorder _underLineFocusedErrorBorder =
      UnderlineInputBorder(
    borderRadius: textBorderRadius,
    borderSide: BorderSide(
      color: Colors.red,
      width: borderWidth,
    ),
  );
}
