import 'package:flutter/widgets.dart';

enum DeviceType { smallPhone, phone, tablet, largeTablet, desktop }

enum ScreenOrientation { portrait, landscape }

class ResponsiveHelper {
  ResponsiveHelper._();

  // ============================================================
  // BREAKPOINTS
  // ============================================================

  static const double smallPhoneBreakpoint = 360;
  static const double phoneBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  /// Width at which a navigation drawer becomes a permanent sidebar.
  static const double sidebarBreakpoint = 1100;

  /// Width at which desktop content gets a larger layout.
  static const double largeDesktopBreakpoint = 1440;

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
  // DEVICE TYPE
  // ============================================================

  static DeviceType deviceTypeFromContext(BuildContext context) {
    final width = screenWidth(context);

    if (width >= desktopBreakpoint) {
      return DeviceType.desktop;
    }

    if (width >= tabletBreakpoint) {
      return DeviceType.largeTablet;
    }

    if (width >= phoneBreakpoint) {
      return DeviceType.tablet;
    }

    if (width >= smallPhoneBreakpoint) {
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
  // LAYOUT CHECKS
  // ============================================================

  /// Mobile layout.
  ///
  /// Drawer navigation is used.
  static bool isMobileLayout(BuildContext context) {
    return screenWidth(context) < sidebarBreakpoint;
  }

  /// Desktop/tablet-wide layout.
  ///
  /// Permanent sidebar is used.
  static bool isSidebarLayout(BuildContext context) {
    return screenWidth(context) >= sidebarBreakpoint;
  }

  /// Large desktop layout.
  static bool isLargeDesktop(BuildContext context) {
    return screenWidth(context) >= largeDesktopBreakpoint;
  }

  // ============================================================
  // SIDEBAR
  // ============================================================

  static double sidebarWidth(BuildContext context) {
    final width = screenWidth(context);

    if (width >= largeDesktopBreakpoint) {
      return 280;
    }

    return 250;
  }

  // ============================================================
  // CONTENT WIDTH
  // ============================================================

  static double maxContentWidth(BuildContext context) {
    if (isLargeDesktop(context)) {
      return 1400;
    }

    if (isSidebarLayout(context)) {
      return 1200;
    }

    return double.infinity;
  }

  // ============================================================
  // RESPONSIVE SCALE
  // ============================================================

  static double scale(BuildContext context) {
    final width = screenWidth(context);

    if (width < smallPhoneBreakpoint) {
      return 0.90;
    }

    if (width < phoneBreakpoint) {
      return 1.00;
    }

    if (width < tabletBreakpoint) {
      return 1.10;
    }

    if (width < desktopBreakpoint) {
      return 1.15;
    }

    return 1.00;
  }

  static double responsiveValue(BuildContext context, double baseValue) {
    return baseValue * scale(context);
  }

  // ============================================================
  // RESPONSIVE WIDTH VALUE
  // ============================================================

  static double responsiveWidth(
    BuildContext context,
    double baseValue, {
    double referenceWidth = 390,
    double minScale = 0.90,
    double maxScale = 1.20,
  }) {
    final width = screenWidth(context);

    final calculatedScale = width / referenceWidth;

    final clampedScale = calculatedScale.clamp(minScale, maxScale);

    return baseValue * clampedScale;
  }

  // ============================================================
  // RESPONSIVE HEIGHT VALUE
  // ============================================================

  static double responsiveHeight(
    BuildContext context,
    double baseValue, {
    double referenceHeight = 844,
    double minScale = 0.85,
    double maxScale = 1.15,
  }) {
    final height = screenHeight(context);

    final calculatedScale = height / referenceHeight;

    final clampedScale = calculatedScale.clamp(minScale, maxScale);

    return baseValue * clampedScale;
  }

  // ============================================================
  // RESPONSIVE DIMENSION
  // ============================================================

  static double responsiveDimension(BuildContext context, double baseValue) {
    if (isPortrait(context)) {
      return responsiveWidth(context, baseValue);
    }

    return responsiveHeight(context, baseValue);
  }

  // ============================================================
  // RESPONSIVE GAP
  // ============================================================

  static double responsiveGap(BuildContext context, double baseGap) {
    return responsiveDimension(context, baseGap);
  }

  // ============================================================
  // RESPONSIVE PADDING
  // ============================================================

  static EdgeInsets responsivePadding(BuildContext context, double base) {
    final value = responsiveDimension(context, base);

    return EdgeInsets.all(value);
  }

  static EdgeInsets responsiveHorizontalPadding(
    BuildContext context,
    double base,
  ) {
    final value = responsiveWidth(context, base);

    return EdgeInsets.symmetric(horizontal: value);
  }

  static EdgeInsets responsiveVerticalPadding(
    BuildContext context,
    double base,
  ) {
    final value = responsiveHeight(context, base);

    return EdgeInsets.symmetric(vertical: value);
  }
}
