import 'package:flutter/widgets.dart';

import '../helpers/responsive_helper.dart';

extension MySizesExtension on BuildContext {
  // ============================================================
  // SCREEN
  // ============================================================

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get shortestSide => MediaQuery.sizeOf(this).shortestSide;

  double get longestSide => MediaQuery.sizeOf(this).longestSide;

  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  // ============================================================
  // DEVICE
  // ============================================================

  DeviceType get deviceType => ResponsiveHelper.deviceTypeFromContext(this);

  bool get isSmPhone => deviceType == DeviceType.smallPhone;

  bool get isPhone => deviceType == DeviceType.phone;

  bool get isTablet =>
      deviceType == DeviceType.tablet || deviceType == DeviceType.largeTablet;

  bool get isLgTablet => deviceType == DeviceType.largeTablet;

  bool get isDesktop => deviceType == DeviceType.desktop;

  // ============================================================
  // ICONS
  // ============================================================

  double get iconXl => responsive(40);

  double get iconLg => responsive(32);

  double get iconMd => responsive(24);

  double get iconSm => responsive(20);

  double get iconXs => responsive(16);

  // ============================================================
  // SPACING
  // ============================================================

  double get spaceXxs => gap(4);

  double get spaceXs => gap(8);

  double get spaceSm => gap(12);

  double get spaceMd => gap(16);

  double get spaceLg => gap(24);

  double get spaceXl => gap(32);

  double get spaceXxl => gap(40);

  double get spaceHuge => gap(48);

  double get spaceSection => gap(64);

  double get spaceSectionLg => gap(80);

  // ============================================================
  // PADDING
  // ============================================================

  EdgeInsets get paddingXs => EdgeInsets.all(gap(8));

  EdgeInsets get paddingSm => EdgeInsets.all(gap(12));

  EdgeInsets get paddingMd => EdgeInsets.all(gap(16));

  EdgeInsets get paddingLg => EdgeInsets.all(gap(24));

  EdgeInsets get paddingXl => EdgeInsets.all(gap(32));

  // Horizontal

  EdgeInsets get paddingHorizontalXs =>
      EdgeInsets.symmetric(horizontal: gap(8));

  EdgeInsets get paddingHorizontalSm =>
      EdgeInsets.symmetric(horizontal: gap(12));

  EdgeInsets get paddingHorizontalMd =>
      EdgeInsets.symmetric(horizontal: gap(16));

  EdgeInsets get paddingHorizontalLg =>
      EdgeInsets.symmetric(horizontal: gap(24));

  EdgeInsets get paddingHorizontalXl =>
      EdgeInsets.symmetric(horizontal: gap(32));

  // Vertical

  EdgeInsets get paddingVerticalXs => EdgeInsets.symmetric(vertical: gap(8));

  EdgeInsets get paddingVerticalSm => EdgeInsets.symmetric(vertical: gap(12));

  EdgeInsets get paddingVerticalMd => EdgeInsets.symmetric(vertical: gap(16));

  EdgeInsets get paddingVerticalLg => EdgeInsets.symmetric(vertical: gap(24));

  EdgeInsets get paddingVerticalXl => EdgeInsets.symmetric(vertical: gap(32));

  // ============================================================
  // COMMON SCREEN PADDING
  // ============================================================

  EdgeInsets get screenPadding {
    if (isDesktop) {
      return EdgeInsets.symmetric(horizontal: gap(48));
    }

    if (isLgTablet) {
      return EdgeInsets.symmetric(horizontal: gap(40));
    }

    if (isTablet) {
      return EdgeInsets.symmetric(horizontal: gap(32));
    }

    return EdgeInsets.symmetric(horizontal: gap(16));
  }

  double get screenHorizontalPadding {
    if (isDesktop) return gap(48);
    if (isLgTablet) return gap(40);
    if (isTablet) return gap(32);

    return gap(16);
  }

  // =============================================================
  //  Radius
  // ============================================================
  double get radiusXs => ResponsiveHelper.responsiveValue(this, 4);
  double get radiusSm => ResponsiveHelper.responsiveValue(this, 8);
  double get radiusMd => ResponsiveHelper.responsiveValue(this, 12);
  double get radiusLg => ResponsiveHelper.responsiveValue(this, 16);
  double get radiusXl => ResponsiveHelper.responsiveValue(this, 20);
  double get radiusCircle => ResponsiveHelper.responsiveValue(this, 500);

  // ============================================================
  // CARD
  // ============================================================
  double get cardMinHeight => responsive(80);

  double get cardRadius => responsive(12);

  double get cardRadiusSm => responsive(8);

  double get cardRadiusLg => responsive(16);

  EdgeInsets get cardPadding => EdgeInsets.all(gap(16));

  EdgeInsets get cardPaddingSm => EdgeInsets.all(gap(12));

  EdgeInsets get cardPaddingLg => EdgeInsets.all(gap(24));

  // ============================================================
  // CONTAINERS
  // ============================================================

  double get containerRadius => responsive(12);

  double get containerRadiusSm => responsive(8);

  double get containerRadiusLg => responsive(16);

  double get containerRadiusXl => responsive(20);

  // ============================================================
  // INPUTS
  // ============================================================

  double get inputHeight => responsive(48);

  double get inputHeightSm => responsive(40);

  double get inputHeightLg => responsive(56);

  double get inputRadius => responsive(10);

  double get inputRadiusSm => responsive(8);

  double get inputRadiusLg => responsive(12);

  EdgeInsets get inputPadding =>
      EdgeInsets.symmetric(horizontal: gap(16), vertical: gap(12));

  // ============================================================
  // BUTTONS
  // ============================================================

  double get buttonHeight => responsive(40);

  double get buttonHeightSm => responsive(32);

  double get buttonHeightMd => responsive(40);

  double get buttonHeightLg => responsive(48);

  double get buttonHeightXl => responsive(56);

  double get buttonRadius => responsive(8);

  double get buttonRadiusSm => responsive(6);

  double get buttonRadiusLg => responsive(12);

  EdgeInsets get buttonPadding =>
      EdgeInsets.symmetric(horizontal: gap(16), vertical: gap(8));

  EdgeInsets get buttonPaddingSm =>
      EdgeInsets.symmetric(horizontal: gap(12), vertical: gap(6));

  EdgeInsets get buttonPaddingLg =>
      EdgeInsets.symmetric(horizontal: gap(24), vertical: gap(12));

  // ============================================================
  // AVATAR
  // ============================================================

  double get avatarXs => responsive(24);

  double get avatarSm => responsive(32);

  double get avatarMd => responsive(40);

  double get avatarLg => responsive(48);

  double get avatarXl => responsive(64);

  double get avatarXxl => responsive(80);

  // ============================================================
  // IMAGE
  // ============================================================

  double get imageXs => responsive(48);

  double get imageSm => responsive(80);

  double get imageMd => responsive(160);

  double get imageLg => responsive(240);

  double get imageXl => responsive(320);

  // ============================================================
  // LIST / GRID
  // ============================================================

  double get listItemHeight => responsive(56);

  double get listItemHeightSm => responsive(48);

  double get listItemHeightLg => responsive(72);

  double get listItemSpacing => gap(12);

  double get gridSpacing => gap(16);

  double get gridRunSpacing => gap(16);

  // ============================================================
  // DIVIDERS
  // ============================================================

  double get dividerThickness => 1;

  double get dividerIndent => gap(16);

  // ============================================================
  // BORDERS
  // ============================================================

  double get borderWidth => 1;

  double get borderWidthFocused => 2;

  // ============================================================
  // ELEVATION
  // ============================================================

  double get elevationNone => 0;

  double get elevationSm => 2;

  double get elevationMd => 4;

  double get elevationLg => 8;

  double get elevationXl => 12;

  // ============================================================
  // BADGES / CHIPS
  // ============================================================

  double get chipHeight => responsive(32);

  double get chipHeightSm => responsive(28);

  double get chipHeightLg => responsive(36);

  double get chipRadius => responsive(8);

  double get badgeSize => responsive(20);

  double get badgeSizeLg => responsive(24);

  // ============================================================
  // APP BAR
  // ============================================================

  double get appBarHeight => responsive(56);

  double get appBarHeightLg => responsive(64);

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  double get bottomNavigationHeight => responsive(64);

  double get bottomNavigationIconSize => responsive(24);

  // ============================================================
  // DIALOG
  // ============================================================

  double get dialogRadius => responsive(16);

  EdgeInsets get dialogPadding => EdgeInsets.all(gap(24));

  double get dialogMaxWidth {
    if (isDesktop) return 520;
    if (isTablet) return 480;

    return screenWidth - gap(32);
  }

  // ============================================================
  // BOTTOM SHEET
  // ============================================================

  double get bottomSheetRadius => responsive(20);

  EdgeInsets get bottomSheetPadding => EdgeInsets.all(gap(24));

  // ============================================================
  // FAB
  // ============================================================

  double get fabSize => responsive(56);

  double get fabSizeSm => responsive(40);

  double get fabSizeLg => responsive(64);

  // ============================================================
  // RESPONSIVE HELPERS
  // ============================================================

  double responsive(double value) {
    return ResponsiveHelper.responsiveValue(this, value);
  }

  double gap(double value) {
    return ResponsiveHelper.responsiveGap(this, value);
  }

  double widthPercent(double percent) {
    return screenWidth * (percent / 100);
  }

  double heightPercent(double percent) {
    return screenHeight * (percent / 100);
  }

  double minDimension(double value) {
    return shortestSide * (value / 100);
  }

  double maxDimension(double value) {
    return longestSide * (value / 100);
  }
  // ============================================================
  // TEXT
  // ============================================================

  /// Display
  double get displayXl => responsive(48);

  double get displayLg => responsive(40);

  double get displayMd => responsive(36);

  double get displaySm => responsive(32);

  /// Headlines
  double get headlineXl => responsive(30);

  double get headlineLg => responsive(28);

  double get headlineMd => responsive(24);

  double get headlineSm => responsive(22);

  double get headlineXs => responsive(20);

  /// Titles
  double get titleXl => responsive(22);

  double get titleLg => responsive(20);

  double get titleMd => responsive(18);

  double get titleSm => responsive(16);

  double get titleXs => responsive(14);

  /// Body
  double get bodyXl => responsive(18);

  double get bodyLg => responsive(16);

  double get bodyMd => responsive(14);

  double get bodySm => responsive(13);

  double get bodyXs => responsive(12);

  /// Labels
  double get labelLg => responsive(14);

  double get labelMd => responsive(12);

  double get labelSm => responsive(11);

  double get labelXs => responsive(10);

  /// Captions / supporting text
  double get captionLg => responsive(13);

  double get captionMd => responsive(12);

  double get captionSm => responsive(11);

  double get captionXs => responsive(10);

  /// Buttons
  double get buttonTextLg => responsive(16);

  double get buttonTextMd => responsive(14);

  double get buttonTextSm => responsive(13);

  double get buttonTextXs => responsive(12);

  /// Navigation
  double get navigationTextLg => responsive(16);

  double get navigationTextMd => responsive(14);

  double get navigationTextSm => responsive(12);

  /// Overline / tiny UI text
  double get overline => responsive(10);

  double get helperText => responsive(12);

  double get errorText => responsive(12);
}
