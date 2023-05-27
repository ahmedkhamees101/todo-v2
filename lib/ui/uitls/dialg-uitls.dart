import 'package:flutter/material.dart';

class DialogUtils {
  static void loadingDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 10,
                ),
                Text(message),
              ],
            ),
          );
        },
        barrierDismissible: false);
  }

  static void showMessage(BuildContext context, String message,
      {String? posActionName,
        String? navActionName,
        VoidCallback? navAction,
        VoidCallback? posActions}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            hideDialog(context);
            posActions?.call();
          },
          child: Text(posActionName)));
    }
    if (navActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            hideDialog(context);
            navAction?.call();
          },
          child: Text(navActionName)));
    }

    showDialog(
        context: context,
        builder: (buildContext) {
          return AlertDialog(
            actions: actions,
            content: Text(message),
          );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
