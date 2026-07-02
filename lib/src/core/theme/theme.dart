import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);
  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 255, 81, 1),
      surfaceTint: Color.fromARGB(127, 109, 73, 56),
      onPrimary: Color(0xffffffff),

      primaryContainer: Color(0xffffdbcc),
      onPrimaryContainer: Color(0xff713619),
      secondary: Color(0xff006874),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9eeffd),
      onSecondaryContainer: Color(0xff004f58),
      tertiary: Color(0xff665f31),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffeee4a9),
      onTertiaryContainer: Color(0xff4e471b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a15),
      onSurfaceVariant: Color(0xff52443d),
      outline: Color(0xff85736c),
      outlineVariant: Color(0xffd8c2ba),
      shadow: Color.fromARGB(58, 127, 127, 127),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2a),
      inversePrimary: Color(0xffffb695),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb695),
      onPrimaryFixedVariant: Color(0xff713619),
      secondaryFixed: Color(0xff9eeffd),
      onSecondaryFixed: Color(0xff001f24),
      secondaryFixedDim: Color(0xff82d3e0),
      onSecondaryFixedVariant: Color(0xff004f58),
      tertiaryFixed: Color(0xffeee4a9),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd1c78f),
      onTertiaryFixedVariant: Color(0xff4e471b),
      surfaceDim: Color(0xffe8d7cf),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1eb),
      surfaceContainer: Color(0xfffceae3),
      surfaceContainerHigh: Color(0xfff6e5dd),
      surfaceContainerHighest: Color(0xfff0dfd8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 255, 81, 1),
      surfaceTint: Color.fromARGB(192, 87, 87, 87),
      onPrimary: Color.fromARGB(255, 251, 251, 251),
      primaryContainer: Color(0xff713619),
      onPrimaryContainer: Color(0xffffdbcc),
      secondary: Color(0xff82d3e0),
      onSecondary: Color(0xff00363d),
      secondaryContainer: Color(0xff004f58),
      onSecondaryContainer: Color(0xff9eeffd),
      tertiary: Color(0xffd1c78f),
      onTertiary: Color(0xff363106),
      tertiaryContainer: Color(0xff4e471b),
      onTertiaryContainer: Color(0xffeee4a9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a120e),
      onSurface: Color(0xfff0dfd8),
      onSurfaceVariant: Color(0xffd8c2ba),
      outline: Color(0xffa08d85),
      outlineVariant: Color(0xff52443d),
      shadow: Color.fromARGB(94, 255, 254, 254),
      scrim: Color.fromARGB(77, 84, 78, 75),
      inverseSurface: Color(0xfff0dfd8),
      inversePrimary: Color(0xff8e4d2e),
      primaryFixed: Color(0xffffdbcc),
      onPrimaryFixed: Color(0xff351000),
      primaryFixedDim: Color(0xffffb695),
      onPrimaryFixedVariant: Color(0xff713619),
      secondaryFixed: Color(0xff9eeffd),
      onSecondaryFixed: Color(0xff001f24),
      secondaryFixedDim: Color(0xff82d3e0),
      onSecondaryFixedVariant: Color(0xff004f58),
      tertiaryFixed: Color(0xffeee4a9),
      onTertiaryFixed: Color(0xff201c00),
      tertiaryFixedDim: Color(0xffd1c78f),
      onTertiaryFixedVariant: Color(0xff4e471b),
      surfaceDim: Color(0xff1a120e),
      surfaceBright: Color(0xff413732),
      surfaceContainerLowest: Color(0xff140c09),
      surfaceContainerLow: Color(0xff221a15),
      surfaceContainer: Color(0xff271e19),
      surfaceContainerHigh: Color(0xff322823),
      surfaceContainerHighest: Color(0xff3d332e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    shadowColor: colorScheme.shadow,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: colorScheme.primary),
        foregroundColor: colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primaryContainer,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),

    cardTheme: CardThemeData(
      elevation: 4,
      shape: const RoundedRectangleBorder(),
      shadowColor: colorScheme.shadow,
      margin: const EdgeInsets.all(8),
      color: colorScheme.surfaceContainer,
    ),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
