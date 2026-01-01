import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_template/utils/logger/logger.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    AppLogger.error(details.exception.toString(),
        stackTrace: details.stack, error: details.exception);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    // Use the enhanced logger for uncaught errors too
    AppLogger.error('Uncaught error: $error', stackTrace: stack, error: error);
    return true;
  };
  final appBuilder = await builder();
  Bloc.observer = MyBlocObserver();
  runApp(appBuilder);
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogger.debug('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.state(
      name: bloc.runtimeType.toString(),
      oldValue: change.currentState,
      newValue: change.nextState,
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.error('onError -- ${bloc.runtimeType}',
        error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogger.debug('onClose -- ${bloc.runtimeType}');
  }
}
