import 'package:flutter/material.dart';

import 'AppStyles.dart';

class DialogUtils {
  static void showLoading({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(message, style: AppStyles.bold20primaryDark),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage({
    required BuildContext context,
    required String message,
    String? title,
    String? posActionName,
    String? negActionName,
    Function? posAction,
    Function? negAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(posActionName, style: AppStyles.bold20primaryDark),
        ),
      );
    }
    if (negActionName != null) {
      actions.add(
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(negActionName, style: AppStyles.bold20primaryDark),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message, style: AppStyles.bold20primaryDark),
          title: Text(title ?? '', style: AppStyles.bold20primaryDark),
          actions: actions,
        );
      },
    );
  }
}
