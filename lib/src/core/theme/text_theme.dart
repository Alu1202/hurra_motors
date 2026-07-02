import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextTheme createTextTheme({
  required String bodyFont,
  required String displayFont,
  required Color textColor,
  required ColorScheme colorScheme,
}) {
  final TextStyle bodyBase = GoogleFonts.getFont(
    bodyFont,
    color: textColor,
    height: 1.3,
  );

  final TextStyle displayBase = GoogleFonts.getFont(
    displayFont,
    color: textColor,
    height: 1.2,
    fontWeight: FontWeight.w600,
  );

  return TextTheme(
    // DISPLAY (Very large)
    displayLarge: displayBase.copyWith(
      fontSize: 57,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: displayBase.copyWith(
      fontSize: 45,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: displayBase.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w600,
    ),

    // HEADLINE (Screen headings)
    headlineLarge: displayBase.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: colorScheme.primary,
    ),
    headlineMedium: displayBase.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: colorScheme.primary,
    ),
    headlineSmall: displayBase.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: colorScheme.primary,
    ),

    // TITLE (Appbar / Card Titles)
    titleLarge: displayBase.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
    titleMedium: displayBase.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: displayBase.copyWith(fontSize: 14, fontWeight: FontWeight.w500),

    // BODY (Normal text)
    bodyLarge: bodyBase.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: bodyBase.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: bodyBase.copyWith(fontSize: 12, fontWeight: FontWeight.w400),

    // LABEL (Buttons, captions)
    labelLarge: bodyBase.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    labelMedium: bodyBase.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: bodyBase.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
  );
}
