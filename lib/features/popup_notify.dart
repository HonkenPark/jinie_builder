import 'package:flutter/material.dart';
import 'package:jinie_builder/common/theme.dart';

class PopupNotify<T> extends PopupRoute<T> {
  final String title;
  final String content;
  final String theme;

  PopupNotify({
    required this.title,
    required this.content,
    required this.theme,
  });

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x50);

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => title;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Center(
      // Provide DefaultTextStyle to ensure that the dialog's text style
      // matches the rest of the text in the app.
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!,
        // UnconstrainedBox is used to make the dialog size itself
        // to fit to the size of the content.
        child: UnconstrainedBox(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: theme == 'pink'
                    ? AppTheme.pinkStrongPink
                    : AppTheme.indigoYellow,
                width: 4.0,
              ),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: theme == 'pink'
                          ? AppTheme.pinkGreen
                          : AppTheme.indigoDeepBlue,
                    )),
                const SizedBox(height: 20),
                Text(content,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkGrey,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
