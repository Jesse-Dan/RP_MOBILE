import 'dart:developer' as developer;

import '../enums/enums.dart';

class Logger {
  final Tag tag;
  final String message;
  final dynamic error;
  final StackTrace? stackTrace;

  Logger({
    required this.tag,
    required this.message,
    this.error,
    this.stackTrace,
  }) {
    _logMessage();
  }

  void _logMessage() {
    final tagString = _tagToString(tag);
    final logPrefix = '[📢 ${DateTime.now()}] ${_tagSymbol(tagString)}';

    developer.log(
      '$logPrefix $message',
      error: error,
      stackTrace: stackTrace,
      name: _tagToString(tag),
      time: DateTime.now(),
    );
  }

  String _tagToString(Tag tag) {
    return tag.toString().split('.').last.toUpperCase();
  }

  String _tagSymbol(String tagString) {
    switch (tagString) {
      case 'INFO':
        return '✨';
      case 'ERROR':
        return '❌';
      case 'WARNING':
        return '⚠️';
      case 'DEBUG':
        return '🐞';
      default:
        return '🔧';
    }
  }

  static void log({
    required Tag tag,
    required String message,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    Logger(
      tag: tag,
      message: message,
      error: error,
      stackTrace: stackTrace,
    );
  }
}