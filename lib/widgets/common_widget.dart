import 'package:flutter/cupertino.dart';

import '../app.export.dart';

class NoContentLabel extends StatelessWidget {
  const NoContentLabel({
    Key? key,
    required this.title,
    this.style,
    this.onPress,
    this.imgStr = "",
  }) : super(key: key);
  final String title;
  final TextStyle? style;
  final Function? onPress;
  final String imgStr;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imgStr.isEmpty
                ? Container()
                : SizedBox(
                    height: 100.0,
                    width: 100.0,
                    child: Image.asset(
                      imgStr,
                    ),
                  ),
            const SizedBox(height: 20.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: style ?? Theme.of(context).textTheme.headline2!,
            ),
            const SizedBox(height: 10.0),
            onPress == null
                ? Container()
                : TextButton(
                    child: Text(
                      StaticString.retry,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.blue),
                    ),
                    onPressed: () => onPress,
                  ),
          ],
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Color? color;
  final TextStyle? style;
  final Decoration? decoration;
  final double? width;

  const CommonButton(
      {Key? key,
      required this.title,
      this.icon,
      this.onPressed,
      this.width,
      this.padding,
      this.decoration,
      this.style,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? double.infinity,
      decoration: decoration,
      padding: padding ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: icon != null
            ? ElevatedButton.icon(
                onPressed: onPressed,
                icon: icon ?? Container(),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color),
                    alignment: Alignment.centerLeft),
                label: Text(
                  title,
                  style: style ??
                      Theme.of(context).textTheme.headline6!.copyWith(
                            color:
                                onPressed == null ? Colors.grey : Colors.white,
                          ),
                ))
            : ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color)),
                child: Text(
                  title,
                  style: style ??
                      Theme.of(context).textTheme.headline6!.copyWith(
                            color:
                                onPressed == null ? Colors.grey : Colors.white,
                          ),
                ),
              ),
      ),
    );
  }
}

// Show snack bar...
void showSnackBar(dynamic msg) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(
        msg.toString(),
      ),
    ),
  );
}

void showCupertinoPicker(
    {required void Function(int)? onSelectedItemChanged,
    required List<String> list}) {
  // Show sheet...
  showModalBottomSheet(
    context: navigatorKey.currentState!.context,
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: CupertinoPicker(
        itemExtent: 30,
        scrollController: FixedExtentScrollController(),
        onSelectedItemChanged: onSelectedItemChanged,
        children: List<Widget>.generate(list.length, (int index) {
          return Center(
            child: Text(list[index]),
          );
        }),
      ),
    ),
  );
}
