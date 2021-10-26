import 'package:flutterdemo/model/user_model.dart';
import 'package:flutterdemo/utils/firebase_auth_service.dart';
import 'package:flutterdemo/widgets/common_widget.dart';
import 'package:flutterdemo/widgets/loading_indicator_overlay.dart';

import '../app.export.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _userInfo;

  // Getter...
  UserModel? get userInfo => this._userInfo;

  // Setter...
  set userInfo(UserModel? value) => this._userInfo = value;

  bool get isUserLoggedIn => userInfo != null;

  // Login...
  Future<void> login({required UserModel userModel}) async {
    try {
      // Show loading indicator...
      LoadingIndicator.instance.showLoadingIndicator();

      // Login with email password...
      await FirebaseAuthService.instance.signInWithEmailPassword(
          email: userModel.email!, password: userModel.password!);
      notifyListeners();
    } catch (e) {
      // Show snack bar...
      showSnackBar(e);
    } finally {
      // Hide loading indicator...
      LoadingIndicator.instance.hideLoadingIndicator();
    }
  }

  // SignUp...
  Future<void> SignUp({required UserModel userModel}) async {
    try {
      // Show loading indicator...
      LoadingIndicator.instance.showLoadingIndicator();

      // Login with email password...
      User? _user = await FirebaseAuthService.instance.signUpWithEmailPassword(
          email: userModel.email!, password: userModel.password!);
      if (_user != null) {
        userInfo = UserModel(
            displayName: _user.displayName, email: _user.email, id: _user.uid);
      }
      notifyListeners();
    } catch (e) {
      // Show snack bar...
      showSnackBar(e);
    } finally {
      // Hide loading indicator...
      LoadingIndicator.instance.hideLoadingIndicator();
    }
  }

  // Forgot password...
  Future<void> forgotPassword({required UserModel userModel}) async {
    try {
      // Show loading indicator...
      LoadingIndicator.instance.showLoadingIndicator();

      // Login with email password...
      await FirebaseAuthService.instance.forgotPassword(userModel.email!);
    } catch (e) {
      // Show snack bar...
      showSnackBar(e);
    } finally {
      // Hide loading indicator...
      LoadingIndicator.instance.hideLoadingIndicator();
    }
  }
}
