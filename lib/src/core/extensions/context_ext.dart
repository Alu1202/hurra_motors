import 'package:flutter/material.dart';

extension ThemeHelper on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  TextStyle? get bodyTextStyleOnPrimary =>
      theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get headlineMediumOnPrimary => theme.textTheme.headlineMedium
      ?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get headlineLargeOnPrimary => theme.textTheme.headlineLarge
      ?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get labelLargeOnPrimary =>
      theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get labelMediumOnPrimary =>
      theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get labelSmallOnPrimary =>
      theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get bodyMediumOnPrimary =>
      theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get bodySmallOnPrimary =>
      theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get titleMediumOnPrimary =>
      theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get titleLargeOnPrimary =>
      theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onPrimary);

  TextStyle? get displayLargeOnPrimary => theme.textTheme.displayLarge
      ?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get displayMediumOnPrimary => theme.textTheme.displayMedium
      ?.copyWith(color: theme.colorScheme.onPrimary);
  TextStyle? get displaySmallOnPrimary => theme.textTheme.displaySmall
      ?.copyWith(color: theme.colorScheme.onPrimary);
}

extension Dialoghelper on BuildContext {
  void showAlertSnackbar(
    String message, {
    VoidCallback? onPositive,
    VoidCallback? onNegative,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        action: onPositive != null
            ? SnackBarAction(label: 'OK', onPressed: onPositive)
            : null,
        showCloseIcon: onNegative != null,
        
      ),
    );
  }


  void showAlertDialog(
    String title,
    String content, {
    VoidCallback? onPositive,
    VoidCallback? onNegative,
  }) {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (onNegative != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onNegative();
              },
              child: const Text('Cancel'),
            ),
          if (onPositive != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onPositive();
              },
              child: const Text('OK'),
            ),
        ],
      ),
    );
  }
}
