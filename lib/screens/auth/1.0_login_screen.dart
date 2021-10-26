import 'package:form_field_validator/form_field_validator.dart';

import '../../app.export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form...
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  // Keys...
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Flags...
  bool _obscureText = true;

  // Models...
  UserModel userInfo = UserModel();

  // Provider...
  AuthProvider get mutedProvider =>
      Provider.of<AuthProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // Hide keyboard...
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          // Infocus...
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        // Body...
        body: _buildBody(),
      ),
    );
  }

  // Body...
  Widget _buildBody() {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sign in text...
            Text(
              StaticString.signIn,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            // Text form fileds form...
            _buildForm(),
            // Forgot password...
            FittedBox(
              fit: BoxFit.scaleDown,
              child: TextButton(
                onPressed: forgotPasswordTapAction,
                child: Text(
                  StaticString.forgotPassword,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Sign in btn...
            CommonButton(
              title: StaticString.signIn,
              onPressed: onSignInTapAction,
            ),
            const SizedBox(height: 30),
            Center(
              child: CustomRichText(
                title: StaticString.dontHaveAccount,
                onTap: signUpTapAction,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Text form fileds form...
  Widget _buildForm() {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidate,
      child: Column(
        children: [
          // Email...
          TextFormField(
            decoration: const InputDecoration(
              hintText: StaticString.email,
            ),
            textInputAction: TextInputAction.next,
            validator: MultiValidator([
              // Required validator...
              RequiredValidator(errorText: AlertMessageString.emptyEmail),
              // Email validator...
              EmailValidator(errorText: AlertMessageString.validEmail)
            ]),
            onSaved: (val) => userInfo.email = val,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          // Password...
          TextFormField(
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                hintText: StaticString.password,
                suffixIcon: IconButton(
                  onPressed: onSuffixIconTapAction,
                  icon: Icon(_obscureText == true
                      ? Icons.visibility
                      : Icons.visibility_off),
                )),
            obscureText: _obscureText,
            validator: MultiValidator([
              // Required validator...
              RequiredValidator(errorText: AlertMessageString.emptyPwd),
              // Min length validator...
              MinLengthValidator(8,
                  errorText: AlertMessageString.validPassword),
            ]),
            onSaved: (val) => userInfo.password = val,
          ),
        ],
      ),
    );
  }

  // On suffix icon tap action...
  void onSuffixIconTapAction() {
    if (mounted) {
      setState(() {
        _obscureText = !_obscureText;
      });
    }
  }

  // Sign in tap action...
  Future<void> onSignInTapAction() async {
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

      mutedProvider.login(userModel: userInfo);
    } catch (e) {
      print(e);
    }
  }

  // Forgot password tap action...
  void forgotPasswordTapAction() {
    // Push to forgot password screen...
    Navigator.of(context).pushNamed(ForgotPasswordScreen.route);
  }

  // Sign up tap action...
  void signUpTapAction() {
    // Push to sign up screen...
    Navigator.of(context).pushNamed(SignUpScreen.route);
  }
}
