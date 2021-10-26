import 'package:form_field_validator/form_field_validator.dart';

import '../../app.export.dart';

class SignUpScreen extends StatefulWidget {
  static String route = "signup_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            // Sign up text...
            Text(
              StaticString.signUp,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            // Text form fileds form...
            _buildForm(),
            const SizedBox(height: 30),
            // Sign up btn...
            CommonButton(
              title: StaticString.signUp,
              onPressed: onSignUpTapAction,
            ),
            const SizedBox(height: 30),
            // Already have account...
            Center(
              child: CustomRichText(
                title: StaticString.alReadyHaveAccount,
                onTap: signInTapAction,
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
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    }
                  },
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

  // Sign up tap action...
  Future<void> onSignUpTapAction() async {
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

      await mutedProvider.signUp(userModel: userInfo);
      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  // Sign in tap action...
  void signInTapAction() {
    Navigator.of(context).pop();
  }
}
