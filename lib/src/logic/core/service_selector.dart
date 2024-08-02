class Service {
  final String value;
  final String url;

  const Service._(this.value, this.url);

  static const AUTH_SERVICE =
      Service._('AUTH_SERVICE', 'http://172.20.10.2:8000/api/');
  static const PREF_SERVICE =
      Service._('PREF_SERVICE', 'http://127.0.0.1:8000/api/');
  static const ADS_SERVICE =
      Service._('PREF_SERVICE', 'http://127.0.0.1:8000/api/');
  static const PAYMENT_SERVICE =
      Service._('PREF_SERVICE', 'http://127.0.0.1:8000/api/');

  static const RP_SERVICE =
      Service._('PREF_SERVICE', 'http://127.0.0.1:8001/api/');

  String get name => value;
}
