import 'package:form_field_validator/form_field_validator.dart';

import '../../app.export.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String route = "forgot_password";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Auto validate...
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  // Key...
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Model...
  final UserModel _userInfo = UserModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // Remove focus...
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // App bar...
        appBar: AppBar(
          title: const Text(
            StaticString.forgotPasswordScreen,
          ),
        ),
        // Body...
        body: _buildBody(context),
      ),
    );
  }

  // Body...
  Widget _buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // We have sent a reset password link to your email account....
            Text(
              StaticString.forgotPasswordMsg,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 45),
            // Email...
            Form(
              autovalidateMode: _autoValidate,
              key: _formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: StaticString.email,
                ),
                validator:
                    EmailValidator(errorText: AlertMessageString.validEmail),
                onSaved: (val) => _userInfo.email = val ?? "",
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 30),
            // Submit...
            CommonButton(
              title: StaticString.submit,
              onPressed: () => submitTapAction(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Submit tap action...
  Future<void> submitTapAction(BuildContext context) async {
    try {
      // Remove focus from textfield if any textfield has focus...
      FocusScope.of(context).requestFocus(FocusNode());

      // Validate Form fields data and return if data is not validated...
      if (!_formKey.currentState!.validate()) {
        if (mounted) {
          setState(() => _autoValidate = AutovalidateMode.always);
        }
        return;
      }

      // Save Detail if form data is validated...
      _formKey.currentState?.save();

      await Provider.of<AuthProvider>(context, listen: false)
          .forgotPassword(userModel: _userInfo);
      Navigator.of(context).maybePop();
    } catch (e) {
      print(e);
    }
  }
}
