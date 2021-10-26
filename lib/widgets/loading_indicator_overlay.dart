import '../app.export.dart';

class LoadingIndicator {
  LoadingIndicator._();

  // Instance...
  static LoadingIndicator instance = LoadingIndicator._();

  bool _isShowingLoader = false;

  // Show loading indicator...
  void showLoadingIndicator(
      {LoadingIndicatorType loadingIndicatorType =
          LoadingIndicatorType.Overlay}) {
    // Check already showing indicator or not...
    if (!_isShowingLoader) {
      _isShowingLoader = true;
      debugPrint(
          "------------------------------- Show loading indicator -------------------------------");
      Navigator.of(navigatorKey.currentContext!)
          .push(LoadingOverlay(loadingIndicatorType: loadingIndicatorType));
    }
  }

  // Hide loading indicator...
  void hideLoadingIndicator() {
    if (_isShowingLoader) {
      _isShowingLoader = false;
      debugPrint(
          "------------------------------- Hide loading indicator -------------------------------");
      Navigator.of(navigatorKey.currentContext!).pop();
    }
  }
}

class LoadingOverlay extends ModalRoute<void> {
  final LoadingIndicatorType loadingIndicatorType;
  LoadingOverlay({this.loadingIndicatorType = LoadingIndicatorType.Overlay});
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => loadingIndicatorType == LoadingIndicatorType.Spinner
      ? Colors.transparent
      : Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => "";

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return const Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: Center(
      child: SizedBox(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

// Loading indicator type enum...
enum LoadingIndicatorType { Overlay, Spinner, None }
