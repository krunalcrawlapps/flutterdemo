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
      body: _builfBody(),
    );
  }

  // App bar...
  AppBar _buildAppbar() {
    return AppBar();
  }

  // Body...
  Widget _builfBody() {
    return Column(
      children: const [],
    );
  }
}
