import '../app.export.dart';

class AuthProvider with ChangeNotifier {
  // Getter...
  UserModel? get userInfo => SharedPreferencesHelper.getUserInfo;

  // Setter...
  set userInfo(UserModel? value) {
    SharedPreferencesHelper.setUserInfo = value;

    if (value != null) {
      notifyListeners();
    }
  }

  bool get isUserLoggedIn => userInfo != null;

  // Login...
  Future<void> login({required UserModel userModel}) async {
    try {
      // Show loading indicator...
      LoadingIndicator.instance.showLoadingIndicator();

      // Login with email password...
      User? _user = await FirebaseAuthService.instance.signInWithEmailPassword(
          email: userModel.email!, password: userModel.password!);

      if (_user != null) {
        // Convert firebase user model to own user model...
        userInfo = convertUserToUserModel(_user);
      }
    } catch (e) {
      // Show snack bar...
      showSnackBar(e);
    } finally {
      // Hide loading indicator...
      LoadingIndicator.instance.hideLoadingIndicator();
    }
  }

  // SignUp...
  Future<void> signUp({required UserModel userModel}) async {
    try {
      // Show loading indicator...
      LoadingIndicator.instance.showLoadingIndicator();

      // Login with email password...
      User? _user = await FirebaseAuthService.instance.signUpWithEmailPassword(
          email: userModel.email!, password: userModel.password!);

      if (_user != null) {
        // Convert firebase user model to own user model...
        userInfo = convertUserToUserModel(_user);
      }
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

  // Logout...
  void signOut() {
    try {
      userInfo = null;
      FirebaseAuthService.instance.signOut;
      notifyListeners();
    } catch (e) {
      // Show snack bar...
      showSnackBar(e);
    }
  }

  // Convert firebase user model to own user model...
  UserModel convertUserToUserModel(User user) {
    String _userName = user.displayName ?? "";
    String _email = user.email ?? "";
    String _id = user.uid;
    return UserModel(email: _email, displayName: _userName, id: _id);
  }
}
