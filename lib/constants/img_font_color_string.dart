import 'package:flutter/material.dart';

class StaticString {
  static const String appName = "Flutter Demo";
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String clear = 'Clear';
  static const String copyRight = "Copyright";
  static const String version = 'Version';
  static const String no = "No";
  static const String yes = "Yes";
  static const String retry = "Retry";
  static const String skip = "Skip";
  static const String submit = "Submit";

  //------------------------------------------------------------------------- Sign In screen ---------------------------------------------------------------------------//
  static const String signIn = "Sign In";
  static const String forgotPassword = "Forgot Password?";
  static const String email = "Email ID";
  static const String password = "Password";
  static const String dontHaveAccount = "Don't have an account? #Sign #Up";

  //------------------------------------------------------------------------- Sign Up screen ---------------------------------------------------------------------------//
  static const String displayName = "Display Name";
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String agreeText =
      "I agree to Sign up for newsletter to stay connected";
  static const String alReadyHaveAccount = "Already Have An Account? #Sign #In";
  static const String signUp = "Sign Up";

  //------------------------------------------------------------------------- Forgot screen ---------------------------------------------------------------------------//
  static const String forgotPasswordScreen = "Forgot Password";
  static const String forgotPasswordMsg =
      "We have sent a reset password link to your email account.";

  //------------------------------------------------------------------------- Home screen ---------------------------------------------------------------------------//
  static const String home = "Home";
}

//-------------------------------------------------------------------------Alert Messages---------------------------------------------------------------------------//
class AlertMessageString {
  static const String validDisplayName = 'Please enter a display name';
  static const String firstName = 'Please enter a first name';
  static const String lastName = 'Please enter a last name';
  static const String validateDobMsg = 'Please enter date of birth';
  static const String address = 'Please enter an address';
  static const String validateCityMsg = 'Please enter a city';
  static const String validateStateMsg = 'Please select a state';
  static const String validEmail = 'Please enter a valid email';
  static const String validPassword = 'Please enter atleast 8 characters';
  static const String validPhoneNumber = "Please enter altest 10 numbers";
  static const String agreeText =
      "Agree to Sign up for newsletter to stay connected";

  // Auth Form Alert Message...
  static const String emptyEmail = 'Please enter your email';
  static const String emptyPwd = 'Please enter your password';
  static const String emptyPhoneNumber = "Please enter phone number";
  static const String emptyOldPassword = 'Please enter your old password';
  static const String emptyNewPassword = 'Please enter your new password';
  static const String emptyConfPassword = 'Please re-enter your password';
  static const String passwordNotMatch = "Password do not match";
  static const String resetPswLinkSent =
      "We sent you a reset password link. please check your email.";

  static const String cancel = 'Cancel';
  static const String settings = "Settings";

  // Permission
  static const String allowPhotoMsg =
      "Access to the photos is denied for this app, go to settings, and allow photos permission to set your profile picture.";

  // Permission
  static const String allowStorageTitle = "Allow Storage Permission";
  static const String allowStorageMsg =
      "Access to the storages is denied for this app, go to settings, and allow storage permission to download your workout video.";

  static const String allowNotificationTitle = "Allow Notification Permission";
  static const String allowNotificationMsg =
      "Permission to send the notification is denied for this app.\nPlease visit settings and enable the notification permission.";

  //Logout...
  static const String logOutTitle = 'Logout';
  static const String logOutMesage = 'Are you sure want to logout?';

  static const String socketException = 'Please try again later';

  static const String noInternet = "No Internet";
  static const String noInternetMsg = "Please check your internet connection";

  static const String unAuthorisedTitle = "UnAuthorised";
  static const String unAuthorisedMsg =
      "The session is expired due to security reasons, please login again to continue.";

  static const String defaultErrorTitle = "Error";
  static const String somethingWentWrong =
      "Something went wrong, please try again later...";
  static const String invalidFormat = "Invalid format";
  static const String httpErrorMsg = "The server is currently unavailable.";

  static const String underMaintainanceTitle = "Under Maintainance";
  static const String underMaintainanceMsg =
      "Sorry, we're down for scheduled maintenance right now, please try after some time.";

  static const String submit = "SUBMIT";
  static const String mayBeLater = "May be later";
}

//------------------------------Images Path----------------------------//

class ImgName {
  //Image Path...
  static const _imgPath = "assets/images/";
}

//------------------------------Custom Fonts----------------------------//

class CustomFont {
  static const String montserrat = 'Montserrat';
}

//------------------------------ Material Color------------------------//
const int _custColorOrange = 0xFFFF743D;

const MaterialColor custMaterialOrange = MaterialColor(
  _custColorOrange,
  <int, Color>{
    50: Color(0xFFFFEEE8),
    100: Color(0xFFFFD5C5),
    200: Color(0xFFFFBA9E),
    300: Color(0xFFFF9E77),
    400: Color(0xFFFF895A),
    500: Color(0xFFFF743D),
    600: Color(0xFFFF6C37),
    700: Color(0xFFFF612F),
    800: Color(0xFFFF5727),
    900: Color(0xFFFF441A),
  },
);

Color custWhite = const Color(0xFFFBFBFB);
Color custGrey = const Color(0xFFE7E7E7);
Color custGreyDark = const Color(0xFFA2A2A2);
Color custShadowColor = const Color(0xFF9EDDFF);
Color custBlack = const Color(0xFF181818);
Color custGreenLight = const Color(0xFFE7F5DD);
Color custGreen = const Color(0xFF51852B);
