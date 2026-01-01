import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

/// Custom logger configuration for better debugging experience
final Logger loggerUtil = Logger(
  printer: PrettyPrinter(
    methodCount: 3, // Number of method calls to display
    errorMethodCount: 10, // Number of method calls for errors
    lineLength: 120, // Width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print emojis for each log level
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    excludeBox: {
      Level.debug: false,
      Level.trace: false,
    },
    noBoxingByDefault: false,
  ),
  filter: DevelopmentFilter(), // Only log in debug mode
  level: kDebugMode ? Level.debug : Level.warning,
);

/// Custom logger class with additional utility methods
class AppLogger {
  static final Logger _logger = loggerUtil;

  /// Log a debug message with optional context
  static void debug(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
  }) {
    if (context != null) {
      _logger.d('$message\n${_formatContext(context)}',
          error: error, stackTrace: stackTrace);
    } else {
      _logger.d(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log an info message with optional context
  static void info(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
  }) {
    if (context != null) {
      _logger.i('$message\n${_formatContext(context)}',
          error: error, stackTrace: stackTrace);
    } else {
      _logger.i(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a warning message with optional context
  static void warning(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
  }) {
    if (context != null) {
      _logger.w('$message\n${_formatContext(context)}',
          error: error, stackTrace: stackTrace);
    } else {
      _logger.w(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log an error message with optional context
  static void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
  }) {
    if (context != null) {
      _logger.e('$message\n${_formatContext(context)}',
          error: error, stackTrace: stackTrace);
    } else {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a trace message (very verbose)
  static void trace(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    Map<String, dynamic>? context,
  }) {
    if (context != null) {
      _logger.t('$message\n${_formatContext(context)}',
          error: error, stackTrace: stackTrace);
    } else {
      _logger.t(message, error: error, stackTrace: stackTrace);
    }
  }

  /// Log a network request
  static void network({
    required String method,
    required String url,
    Map<String, dynamic>? headers,
    dynamic body,
    int? statusCode,
    dynamic response,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('🌐 Network Request');
    buffer.writeln('Method: $method');
    buffer.writeln('URL: $url');

    if (headers != null && headers.isNotEmpty) {
      buffer.writeln('Headers:');
      headers.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    if (body != null) {
      buffer.writeln('Body: $body');
    }

    if (statusCode != null) {
      buffer.writeln('Status Code: $statusCode');
    }

    if (response != null) {
      buffer.writeln('Response: $response');
    }

    _logger.i(buffer.toString());
  }

  /// Log a navigation event
  static void navigation({
    required String from,
    required String to,
    Map<String, dynamic>? params,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('🧭 Navigation');
    buffer.writeln('From: $from');
    buffer.writeln('To: $to');

    if (params != null && params.isNotEmpty) {
      buffer.writeln('Parameters:');
      params.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    _logger.i(buffer.toString());
  }

  /// Log a state change
  static void state({
    required String name,
    dynamic oldValue,
    dynamic newValue,
    Map<String, dynamic>? context,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('🔄 State Change: $name');
    buffer.writeln('Old: $oldValue');
    buffer.writeln('New: $newValue');

    if (context != null && context.isNotEmpty) {
      buffer.writeln('Context:');
      context.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    _logger.d(buffer.toString());
  }

  /// Log a performance metric
  static void performance({
    required String operation,
    required Duration duration,
    Map<String, dynamic>? metrics,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('⚡ Performance');
    buffer.writeln('Operation: $operation');
    buffer.writeln('Duration: ${duration.inMilliseconds}ms');

    if (metrics != null && metrics.isNotEmpty) {
      buffer.writeln('Metrics:');
      metrics.forEach((key, value) {
        buffer.writeln('  $key: $value');
      });
    }

    _logger.i(buffer.toString());
  }

  /// Format context map for better readability
  static String _formatContext(Map<String, dynamic> context) {
    final buffer = StringBuffer();
    buffer.writeln('Context:');
    context.forEach((key, value) {
      if (value is Map || value is List) {
        buffer.writeln('  $key: ${_prettyPrint(value)}');
      } else {
        buffer.writeln('  $key: $value');
      }
    });
    return buffer.toString();
  }

  /// Pretty print complex objects
  static String _prettyPrint(dynamic obj, {int indent = 2}) {
    if (obj == null) return 'null';

    if (obj is Map) {
      if (obj.isEmpty) return '{}';
      final buffer = StringBuffer('{\n');
      obj.forEach((key, value) {
        buffer.write('  ' * indent);
        buffer.write('$key: ');
        if (value is Map || value is List) {
          buffer.writeln(_prettyPrint(value, indent: indent + 1));
        } else {
          buffer.writeln(value);
        }
      });
      buffer.write('  ' * (indent - 1));
      buffer.write('}');
      return buffer.toString();
    }

    if (obj is List) {
      if (obj.isEmpty) return '[]';
      final buffer = StringBuffer('[\n');
      for (var item in obj) {
        buffer.write('  ' * indent);
        if (item is Map || item is List) {
          buffer.writeln(_prettyPrint(item, indent: indent + 1));
        } else {
          buffer.writeln(item);
        }
      }
      buffer.write('  ' * (indent - 1));
      buffer.write(']');
      return buffer.toString();
    }

    return obj.toString();
  }

  /// Start a timer for performance tracking
  static Stopwatch startTimer() {
    return Stopwatch()..start();
  }

  /// Stop timer and log the duration
  static void stopTimer(Stopwatch stopwatch, String operation) {
    stopwatch.stop();
    performance(
      operation: operation,
      duration: stopwatch.elapsed,
    );
  }
}

// Extension for easier logging
extension LoggerExtension on Object {
  /// Log this object with a message
  void log([String? message]) {
    if (message != null) {
      AppLogger.debug('$message: $this');
    } else {
      AppLogger.debug(toString());
    }
  }

  /// Log this object as an error
  void logError([String? message, StackTrace? stackTrace]) {
    if (message != null) {
      AppLogger.error(message, error: this, stackTrace: stackTrace);
    } else {
      AppLogger.error(toString(), stackTrace: stackTrace);
    }
  }
}
