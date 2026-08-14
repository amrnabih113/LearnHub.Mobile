enum DeviceType { mobile, tablet, web }

enum ColorMode { light, dark, system }

extension ColorModeX on ColorMode {
  String get label => switch (this) {
    ColorMode.light => 'Light mode',
    ColorMode.dark => 'Dark mode',
    ColorMode.system => 'System',
  };
}

enum FontSize { small, medium, large, extraLarge }

extension FontSizeX on FontSize {
  String get label => switch (this) {
    FontSize.small => 'Small',
    FontSize.medium => 'Medium',
    FontSize.large => 'Large',
    FontSize.extraLarge => 'Extra Large',
  };
}





  

