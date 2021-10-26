//App Theme... (Set all defaults after complete project ui analysis, take time to decide defaults which will help reducing development time further)
import '../app.export.dart';

class CustomAppTheme {
  static ThemeData lightTheme = ThemeData(
    unselectedWidgetColor: Colors.black,
    brightness: Brightness.light,
    primarySwatch: custMaterialOrange,
    primaryColor: custMaterialOrange,
    textTheme: TextStyleDecoration.getheme,
    // Text theme...
    primaryTextTheme: TextStyleDecoration.getheme,
    backgroundColor: custWhite,
    dividerColor: const Color(0xFFDEDEDE),
    // Divider theme...
    dividerTheme: const DividerThemeData(
      color: Color(0xFFDEDEDE),
      thickness: 1,
    ),
    // Text selection theme...
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    // Text input decoration theme...
    inputDecorationTheme: TextFieldDecoration.getOutLineInputDecoration,
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      height: 55.0,
      buttonColor: custMaterialOrange,
      minWidth: double.infinity,
    ),

    // Bottom navigation bar theme...
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: custMaterialOrange,
      unselectedItemColor: custGrey,
      selectedIconTheme: const IconThemeData(color: custMaterialOrange),
      selectedLabelStyle: TextStyleDecoration.btmNaviBarTextStyle,
      unselectedLabelStyle:
          TextStyleDecoration.btmNaviBarTextStyle.copyWith(color: custGrey),
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(color: custGrey),
    ),
    // Elevated button theme...
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(custMaterialOrange),
        fixedSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
      ),
    ),
    fontFamily: TextStyleDecoration.fontFamily,
    // App bar theme...
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
