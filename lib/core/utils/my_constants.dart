class MyConstants {
  MyConstants._();

  // app name
  static const String appName = "LearnHub";

  // storage keys
  static const String onboardingKey = 'has_seen_onboarding';
  static const String profileSetupKey = 'has_setup_profile';
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String emailKey = 'user_email';
  static const String setupStatusKey = 'setup_status';
  static const String userDataKey = 'user_data';
  static const String annotationTranslationLanguageKey =
      'annotation_translation_language';

  static const String baseUrl =
      'https://learnhub-backend-production.up.railway.app/api';
}
