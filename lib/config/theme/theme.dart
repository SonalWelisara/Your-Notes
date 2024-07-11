import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004794),
      surfaceTint: Color(0xff005cbc),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff2f6ff),  //changed
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff226775),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffE0E8F0),
      onSecondaryContainer: Color(0xff004754),
      tertiary: Color(0xff0b106a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff31378a),
      onTertiaryContainer: Color(0xffd2d3ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff0f4ff),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff45474b),
      outline: Color(0xff75777c),
      outlineVariant: Color(0xffbed2ff),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffabc7ff),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff001b3f),
      primaryFixedDim: Color(0xffabc7ff),
      onPrimaryFixedVariant: Color(0xff004590),
      secondaryFixed: Color(0xffadecfe),
      onSecondaryFixed: Color(0xff001f26),
      secondaryFixedDim: Color(0xff91d0e1),
      onSecondaryFixedVariant: Color(0xff004e5c),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff030766),
      tertiaryFixedDim: Color(0xffbec2ff),
      onTertiaryFixedVariant: Color(0xff373d91),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004188),
      surfaceTint: Color(0xff005cbc),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff006ad7),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004a57),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3d7d8c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0b106a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff31378a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff414347),
      outline: Color(0xff5d5f63),
      outlineVariant: Color(0xff797a7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffabc7ff),
      primaryFixed: Color(0xff1a72df),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0059b7),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3d7d8c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1f6473),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff666dc2),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4d54a7),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00214c),
      surfaceTint: Color(0xff005cbc),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004188),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00262e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004a57),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0b106a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff31378a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff222428),
      outline: Color(0xff414347),
      outlineVariant: Color(0xff414347),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffe5ecff),
      primaryFixed: Color(0xff004188),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002b5f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004a57),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff00323b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff33398c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff1b2075),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffabc7ff),
      surfaceTint: Color(0xffabc7ff),
      onPrimary: Color(0xff002f66),
      primaryContainer: Color(0xff161515),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffe3f8ff),
      onSecondary: Color(0xff003640),
      secondaryContainer: Color(0xff1D1C1C),
      onSecondaryContainer: Color(0xff003f4a),
      tertiary: Color(0xffbec2ff),
      onTertiary: Color(0xff1f2579),
      tertiaryContainer: Color(0xff171d73),
      onTertiaryContainer: Color(0xffaab0ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc6c6cb),
      outline: Color(0xff8f9095),
      outlineVariant: Color(0xffbed2ff),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff005cbc),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff001b3f),
      primaryFixedDim: Color(0xffabc7ff),
      onPrimaryFixedVariant: Color(0xff004590),
      secondaryFixed: Color(0xffadecfe),
      onSecondaryFixed: Color(0xff001f26),
      secondaryFixedDim: Color(0xff91d0e1),
      onSecondaryFixedVariant: Color(0xff004e5c),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff030766),
      tertiaryFixedDim: Color(0xffbec2ff),
      onTertiaryFixedVariant: Color(0xff373d91),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb2cbff),
      surfaceTint: Color(0xffabc7ff),
      onPrimary: Color(0xff001535),
      primaryContainer: Color(0xff468ffe),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe3f8ff),
      onSecondary: Color(0xff003640),
      secondaryContainer: Color(0xff95d4e5),
      onSecondaryContainer: Color(0xff00191f),
      tertiary: Color(0xffc3c6ff),
      onTertiary: Color(0xff00015c),
      tertiaryContainer: Color(0xff8289e1),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xfffefaf9),
      onSurfaceVariant: Color(0xffcacacf),
      outline: Color(0xffa2a3a8),
      outlineVariant: Color(0xff828388),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff004692),
      primaryFixed: Color(0xffd7e2ff),
      onPrimaryFixed: Color(0xff00102c),
      primaryFixedDim: Color(0xffabc7ff),
      onPrimaryFixedVariant: Color(0xff003571),
      secondaryFixed: Color(0xffadecfe),
      onSecondaryFixed: Color(0xff001419),
      secondaryFixedDim: Color(0xff91d0e1),
      onSecondaryFixedVariant: Color(0xff003c47),
      tertiaryFixed: Color(0xffe0e0ff),
      onTertiaryFixed: Color(0xff00014d),
      tertiaryFixedDim: Color(0xffbec2ff),
      onTertiaryFixedVariant: Color(0xff252b7f),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffabc7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb2cbff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff4fcff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff95d4e5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffdf9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc3c6ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffbfaff),
      outline: Color(0xffcacacf),
      outlineVariant: Color(0xffcacacf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff00295a),
      primaryFixed: Color(0xffdee7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb2cbff),
      onPrimaryFixedVariant: Color(0xff001535),
      secondaryFixed: Color(0xffb9f0ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff96d4e5),
      onSecondaryFixedVariant: Color(0xff00191f),
      tertiaryFixed: Color(0xffe5e4ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc3c6ff),
      onTertiaryFixedVariant: Color(0xff00015c),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,

  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

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
