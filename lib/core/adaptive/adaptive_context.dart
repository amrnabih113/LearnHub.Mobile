import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'window_size.dart';

/// Provides adaptive information based on the current Flutter window.
///
/// Use [AdaptiveContext.of] when a widget needs access to the current
/// adaptive state.
///
/// Example:
///
/// ```dart
/// final adaptive = AdaptiveContext.of(context);
///
/// if (adaptive.isCompact) {
///   // Compact layout.
/// }
/// ```
///
/// Prefer this abstraction over repeatedly accessing MediaQuery and
/// performing breakpoint calculations inside feature widgets.
@immutable
class AdaptiveContext {
  const AdaptiveContext._({
    required this.width,
    required this.height,
    required this.windowSize,
    required this.orientation,
  });

  /// Creates an adaptive context from the current [BuildContext].
  factory AdaptiveContext.of(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AdaptiveContext._(
      width: size.width,
      height: size.height,
      windowSize: WindowSizeX.fromWidth(size.width),
      orientation: MediaQuery.orientationOf(context),
    );
  }

  /// Current available window width.
  final double width;

  /// Current available window height.
  final double height;

  /// Current responsive window size.
  final WindowSize windowSize;

  /// Current device orientation.
  final Orientation orientation;

  /// Whether the current window is compact.
  bool get isCompact => windowSize.isCompact;

  /// Whether the current window is medium.
  bool get isMedium => windowSize.isMedium;

  /// Whether the current window is expanded.
  bool get isExpanded => windowSize.isExpanded;

  /// Whether the current layout is portrait.
  bool get isPortrait => orientation == Orientation.portrait;

  /// Whether the current layout is landscape.
  bool get isLandscape => orientation == Orientation.landscape;

  /// Whether the application is running on the web.
  bool get isWeb => kIsWeb;

  /// Whether the application is running on Android.
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// Whether the application is running on iOS.
  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// Whether the application is running on macOS.
  bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;

  /// Whether the application is running on Windows.
  bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  /// Whether the application is running on Linux.
  bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  /// Whether the current platform is a native mobile platform.
  bool get isMobilePlatform => isAndroid || isIOS;

  /// Whether the current platform is a desktop platform.
  bool get isDesktopPlatform =>
      isMacOS || isWindows || isLinux;

  /// Whether the current window is likely being used as a tablet-sized
  /// layout.
  ///
  /// This is a convenience property and should not replace the existing
  /// LearnHub [DeviceType] system.
  bool get isTabletLayout =>
      isMedium && !isDesktopPlatform;

  /// Whether the current layout has enough space for an expanded
  /// presentation.
  bool get hasExpandedWidth => isExpanded;

  @override
  String toString() {
    return 'AdaptiveContext('
        'width: $width, '
        'height: $height, '
        'windowSize: $windowSize, '
        'orientation: $orientation, '
        'isWeb: $isWeb'
        ')';
  }
}

/// Convenience extension for accessing adaptive information.
///
/// Example:
///
/// ```dart
/// if (context.adaptive.isCompact) {
///   ...
/// }
/// ```
extension AdaptiveBuildContextX on BuildContext {
  /// Returns the current adaptive context.
  AdaptiveContext get adaptive => AdaptiveContext.of(this);
}