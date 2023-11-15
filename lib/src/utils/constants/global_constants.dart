// ignore_for_file: constant_identifier_names

class GlobalConstants {
  static const k20 = 20.0;
  static const k16 = 16.0;
  static const k12 = 12.0;
  static const k14 = 14.0;
  static const k0 = 0.0;

  /// HEADER VALUE
  static const String CSRF_TOKEN = 'CSRF-TOKEN';
  static const String BEARER_TOKEN = 'BEARER-TOKEN';

  /// STORAGE KEYS
  static const String CSRF_TOKEN_KEY = 'X-CSRF-TOKEN';

  /// ENDPOINTS
  static const String BASE_URL = 'http://192.168.0.2:8000/rp_api/';
  static const String POSTS_ENDPOINT = 'app/posts';
  static const String CSFR_ENDPOINT = 'auth/token';
}
