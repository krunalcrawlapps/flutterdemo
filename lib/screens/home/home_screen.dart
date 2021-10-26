import '../../app.export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      // Body...
      body: _buildBody(),
    );
  }

  // App bar...
  AppBar _buildAppbar() {
    return AppBar(
      title: const Text(StaticString.home),
      actions: [
        IconButton(
            onPressed: onLogoutTapAction, icon: const Icon(Icons.logout)),
      ],
    );
  }

  // Body...
  Widget _buildBody() {
    return Column(
      children: const [],
    );
  }

  // Logout tap action...
  void onLogoutTapAction() {
    // Sign out...
    Provider.of<AuthProvider>(context, listen: false).signOut();
  }
}
