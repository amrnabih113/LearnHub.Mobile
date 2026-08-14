import 'package:flutter/widgets.dart';

enum DeviceType {
  smallPhone,
  phone,
  tablet,
  largeTablet,
  desktop,
}

enum ScreenOrientation {
  portrait,
  landscape,
}

class ResponsiveHelper {
  ResponsiveHelper._();

  // ============================================================
  // BREAKPOINTS
  // ============================================================

  static const double smallPhoneBreakpoint = 360;
  static const double phoneBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // ============================================================
  // SCREEN INFORMATION
  // ============================================================

  static Size screenSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static double screenWidth(BuildContext context) {
    return screenSize(context).width;
  }

  static double screenHeight(BuildContext context) {
    return screenSize(context).height;
  }

  static ScreenOrientation orientation(BuildContext context) {
    return MediaQuery.orientationOf(context) == Orientation.portrait
        ? ScreenOrientation.portrait
        : ScreenOrientation.landscape;
  }

  static bool isPortrait(BuildContext context) {
    return orientation(context) == ScreenOrientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return orientation(context) == ScreenOrientation.landscape;
  }

  // ============================================================
  // SHORTEST / LONGEST SIDE
  // ============================================================

  /// The shortest screen dimension.
  ///
  /// This is useful for determining the actual device class.
  /// A tablet remains a tablet when rotated.
  static double shortestSide(BuildContext context) {
    final size = screenSize(context);

    return size.width < size.height ? size.width : size.height;
  }

  /// The longest screen dimension.
  static double longestSide(BuildContext context) {
    final size = screenSize(context);

    return size.width > size.height ? size.width : size.height;
  }

  // ============================================================
  // DEVICE TYPE
  // ============================================================

  static DeviceType deviceTypeFromContext(BuildContext context) {
    final shortest = shortestSide(context);

    if (shortest >= desktopBreakpoint) {
      return DeviceType.desktop;
    }

    if (shortest >= tabletBreakpoint) {
      return DeviceType.largeTablet;
    }

    if (shortest >= phoneBreakpoint) {
      return DeviceType.tablet;
    }

    if (shortest >= smallPhoneBreakpoint) {
      return DeviceType.phone;
    }

    return DeviceType.smallPhone;
  }

  // ============================================================
  // DEVICE CHECKS
  // ============================================================

  static bool isSmallPhone(BuildContext context) =>
      deviceTypeFromContext(context) == DeviceType.smallPhone;

  static bool isPhone(BuildContext context) =>
      deviceTypeFromContext(context) == DeviceType.phone;

  static bool isTablet(BuildContext context) =>
      deviceTypeFromContext(context) == DeviceType.tablet;

  static bool isLargeTablet(BuildContext context) =>
      deviceTypeFromContext(context) == DeviceType.largeTablet;

  static bool isDesktop(BuildContext context) =>
      deviceTypeFromContext(context) == DeviceType.desktop;

  // ============================================================
  // ORIENTATION SCALE
  // ============================================================

  static double scale(BuildContext context) {
    final type = deviceTypeFromContext(context);

    if (isPortrait(context)) {
      switch (type) {
        case DeviceType.smallPhone:
          return 0.90;

        case DeviceType.phone:
          return 1.00;

        case DeviceType.tablet:
          return 1.10;

        case DeviceType.largeTablet:
          return 1.15;

        case DeviceType.desktop:
          return 1.00;
      }
    }

    // ----------------------------------------------------------
    // LANDSCAPE
    // ----------------------------------------------------------

    switch (type) {
      case DeviceType.smallPhone:
        return 0.85;

      case DeviceType.phone:
        return 0.90;

      case DeviceType.tablet:
        return 1.00;

      case DeviceType.largeTablet:
        return 1.05;

      case DeviceType.desktop:
        return 1.00;
    }
  }

  // ============================================================
  // RESPONSIVE VALUE
  // ============================================================

  static double responsiveValue(
    BuildContext context,
    double baseValue,
  ) {
    return baseValue * scale(context);
  }

  // ============================================================
  // RESPONSIVE WIDTH VALUE
  // ============================================================

  /// Calculates a value based on the available width.
  ///
  /// Useful for things such as cards and containers.
  static double responsiveWidth(
    BuildContext context,
    double baseValue, {
    double referenceWidth = 390,
    double minScale = 0.90,
    double maxScale = 1.20,
  }) {
    final width = screenWidth(context);

    final calculatedScale = width / referenceWidth;

    final clampedScale = calculatedScale.clamp(
      minScale,
      maxScale,
    );

    return baseValue * clampedScale;
  }

  // ============================================================
  // RESPONSIVE HEIGHT VALUE
  // ============================================================

  /// Calculates a value based on the available height.
  ///
  /// Particularly useful in landscape mode.
  static double responsiveHeight(
    BuildContext context,
    double baseValue, {
    double referenceHeight = 844,
    double minScale = 0.85,
    double maxScale = 1.15,
  }) {
    final height = screenHeight(context);

    final calculatedScale = height / referenceHeight;

    final clampedScale = calculatedScale.clamp(
      minScale,
      maxScale,
    );

    return baseValue * clampedScale;
  }

  // ============================================================
  // ORIENTATION-AWARE VALUE
  // ============================================================

  /// Portrait  -> calculated from width
  /// Landscape -> calculated from height
  static double responsiveDimension(
    BuildContext context,
    double baseValue,
  ) {
    if (isPortrait(context)) {
      return responsiveWidth(
        context,
        baseValue,
      );
    }

    return responsiveHeight(
      context,
      baseValue,
    );
  }

  // ============================================================
  // RESPONSIVE GAP
  // ============================================================

  static double responsiveGap(
    BuildContext context,
    double baseGap,
  ) {
    return responsiveDimension(
      context,
      baseGap,
    );
  }

  // ============================================================
  // RESPONSIVE PADDING
  // ============================================================

  static EdgeInsets responsivePadding(
    BuildContext context,
    double base,
  ) {
    final value = responsiveDimension(
      context,
      base,
    );

    return EdgeInsets.all(value);
  }

  // ============================================================
  // RESPONSIVE HORIZONTAL PADDING
  // ============================================================

  static EdgeInsets responsiveHorizontalPadding(
    BuildContext context,
    double base,
  ) {
    final value = responsiveWidth(
      context,
      base,
    );

    return EdgeInsets.symmetric(
      horizontal: value,
    );
  }

  // ============================================================
  // RESPONSIVE VERTICAL PADDING
  // ============================================================

  static EdgeInsets responsiveVerticalPadding(
    BuildContext context,
    double base,
  ) {
    final value = responsiveHeight(
      context,
      base,
    );

    return EdgeInsets.symmetric(
      vertical: value,
    );
  }
}