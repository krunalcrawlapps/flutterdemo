

import 'app.export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize firebase...
  await Firebase.initializeApp();
  // Run app...
  runApp(const FlutterDemo());
}

// Global key..
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class FlutterDemo extends StatelessWidget {
  const FlutterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Auth provider...
        ChangeNotifierProvider.value(value: AuthProvider()),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        title: StaticString.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Login screen...
        home: Consumer<AuthProvider>(
          builder: (context, auth, child) {
            // If the user is logged in then redirect the user to the home screen otherwise redirect to the login screen.
            return auth.isUserLoggedIn
                ? const HomeScreen()
                : const LoginScreen();
          },
        ),
        // Routes...
        routes: _routes,
      ),
    );
  }

  // Routes...
  Map<String, WidgetBuilder> get _routes {
    return {
      // Sign up screen route...
      SignUpScreen.route: (_) => const SignUpScreen(),
      // Forgot password screen route...
      ForgotPasswordScreen.route: (_) => const ForgotPasswordScreen(),
    };
  }
}
