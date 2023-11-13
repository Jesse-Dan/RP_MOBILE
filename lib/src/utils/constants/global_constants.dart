// ignore_for_file: constant_identifier_names

class GlobalConstants {
  static const kBigText = 16.0;
  static const kSmallText = 12.0;
  static const kMidiText = 14.0;
  static const kZeroText = 0.0;

  /// STORAGE KEYS
  static const String CSRF_TOKEN = 'CSRF-TOKEN';
  static const String CSRF_TOKEN_KEY = 'X-CSRF-TOKEN';

  /// ENDPOINTS
  static const String BASE_URL = 'http://192.168.0.2:8000/rp_api/';
  static const String POSTS_ENDPOINT = 'app/posts';
  static const String CSFR_ENDPOINT = 'auth/token';
}
