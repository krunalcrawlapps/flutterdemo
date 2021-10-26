// overline : 10.0
// caption  : 12.0
// bodytext1: 14.0
// bodytext2: 16.0
// headline1: 18.0
// headline2: 21.0
// headline3: 22.0
// headline4: 24.0
// headline5: 26.0
// headline6: 28.0

import '../app.export.dart';

class TextStyleDecoration {
  // App Default font...
  static const String fontFamily = CustomFont.montserrat;

  // Get Text theme...
  static TextTheme get getheme => TextTheme(
        overline: _overline, // 10.0
        caption: _caption, // 12.0
        bodyText1: _body1, // 14.0
        bodyText2: _body2, // 16.0
        headline1: _headline1, // 18.0
        headline2: _headline2, // 21.0
        headline3: _headline3, // 22.0
        headline4: _headline4, // 24.0
        headline5: _headline5, // 26.0
        headline6: _headline6, // 28.0
        subtitle1:
            _subTitle, // 14.0 this is also used when no style is given to textfield..
        subtitle2: _subHeadline, // 16.0
        button: _button, // 16.0
      );

  static TextStyle get textfieldPlaceholder => TextStyle(
        color: custWhite,
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        fontSize: 14.0,
      );
  static TextStyle get textStyle => TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.w400,
        fontFamily: fontFamily,
        fontSize: 14.0,
      );

  static TextStyle get btmNaviBarTextStyle => const TextStyle(
        color: custMaterialOrange,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        fontSize: 14.0,
      );

  static TextStyle get textUnderLine => const TextStyle(
        decoration: TextDecoration.underline,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: fontFamily,
        fontSize: 16.0,
      );

  static const _overline = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 10.0,
    fontWeight: FontWeight.w700,
  );

  static const _caption = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle _body1 = TextStyle(
    fontFamily: fontFamily,
    color: custBlack,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const _body2 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const _headline1 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
  );

  static const _headline2 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
  );

  static const _headline3 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 22.0,
    fontWeight: FontWeight.w400,
  );

  static const _headline4 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
  );

  static const _headline5 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
  );

  static const _headline6 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
  );

  static final _subTitle = TextStyle(
    fontFamily: fontFamily,
    color: custBlack,
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const _subHeadline = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );

  static const _button = TextStyle(
    fontFamily: fontFamily,
    color: Colors.black,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
}
