import '../app.export.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  // Firebase auth service instance....
  static FirebaseAuthService instance = FirebaseAuthService._();

  // Fireabse auth instance...
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // SignUp with email-password...
  Future<User?> signUpWithEmailPassword(
      {required String email, required String password}) async {
    try {
      // Authenticate user with firebase...
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Throw error...
      throw e.message ?? "Something went wrong";
    } catch (error) {
      // Rethrow...
      rethrow;
    }
  }

  // SignIn with email-password...
  Future<User?> signInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      // Authenticate user with firebase...
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Throw error...
      throw e.message ?? "Something went wrong";
    } catch (error) {
      // Rethrow...
      rethrow;
    }
  }

  // Send forgot password link...
  Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      // Throw error...
      throw e.message ?? "Something went wrong";
    } catch (e) {
      rethrow;
    }
  }

  // Sign out...
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      // Throw error...
      throw e.message ?? "Something went wrong";
    } catch (e) {
      rethrow;
    }
  }
}
