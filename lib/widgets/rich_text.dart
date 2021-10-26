


import '../app.export.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {Key? key,
      required this.title,
      this.normalTextStyle,
      this.fancyTextStyle,
      this.onTap,
      this.maxLines,
      this.textAlign = TextAlign.center})
      : super(key: key);
  final String title;
  final Function? onTap;
  final TextStyle? fancyTextStyle;
  final TextStyle? normalTextStyle;
  final int? maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return RichText(
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: maxLines,
      text: TextSpan(
        style: theme.bodyText2,
        children: title.processCaption(
          matcher: "#",
          normalTextStyle: normalTextStyle ?? theme.bodyText1!,
          fancyTextStyle: fancyTextStyle ??
              theme.bodyText1!.copyWith(fontWeight: FontWeight.w500),
          onTap: onTap ?? () {},
        ),
      ),
    );
  }
}
