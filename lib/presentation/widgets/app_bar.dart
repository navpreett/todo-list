import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    required this.title,
    this.iconData,
    required this.disableIcon,
    this.fontSize,
    super.key,
  });

  final double? fontSize;
  final bool disableIcon;
  final String title;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Row(
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize ?? 60),
                ),
              ),
              disableIcon || iconData == null
                  ? Container()
                  : Icon(iconData, color: Colors.white, size: fontSize ?? 60),
            ],
          ),
          backgroundColor: Colors.blue,
          elevation: 0,
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
/*
This code defines an AppBarWidget which is a stateless widget that implements PreferredSizeWidget. It receives several parameters, such as title, iconData, disableIcon, and fontSize, which are used to build an AppBar with a custom title and an optional icon.

The AppBar has a blue background color and an elevation of 0. It also uses the preferredSize property to set the size of the widget.

The title parameter is used to display the main text in the AppBar. It is wrapped in a Row widget, which also contains an optional icon (specified by the iconData parameter) on the right side of the text.

The disableIcon parameter can be used to hide the icon, and the fontSize parameter sets the font size of both the text and the icon.

The FittedBox widget is used to automatically scale the text to fit within the available space, while the TextOverflow.ellipsis parameter ensures that any overflow is truncated with an ellipsis.

Overall, this widget provides a customizable AppBar with a title and an optional icon, which can be useful in many different types of applications.
 */