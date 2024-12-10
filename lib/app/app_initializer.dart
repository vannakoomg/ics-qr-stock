
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos_mobile/di/di.dart';

import '../core/constants/log_constant.dart';
import '../core/helper/local_data/storge_local.dart';
import '../core/utils/log/log_utils.dart';
import '../core/utils/log/logger_helper.dart';

// abstract class ApplicationConfig extends IConfig {}

class AppInitializer {
  Future<void> init() async {
    Bloc.observer = AppBlocObserver();
    await _appConfig();
    await LoggerHelper.initLogger();
    await _initSystemUIPreferences();
  }
}

Future<void> _initSystemUIPreferences() async {
  // await SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.edgeToEdge,
  //   overlays: [
  //     // SystemUiOverlay.top,
  //   ],
  // );

  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await SystemChrome.setSystemUIChangeCallback(
  //     (systemOverlaysAreVisible) async {
  //   if (systemOverlaysAreVisible) {
  //     await Future.delayed(2.seconds);
  //     await SystemChrome.restoreSystemUIOverlays();
  //   }
  // });
}



Future<void> _appConfig() async {
  await LocalStorage.init();
 
}

class AppBlocObserver extends BlocObserver with LogMixin {
  AppBlocObserver({
    this.logOnChange = LogConstants.logOnBlocChange,
    this.logOnCreate = LogConstants.logOnBlocCreate,
    this.logOnClose = LogConstants.logOnBlocClose,
    this.logOnError = LogConstants.logOnBlocError,
    this.logOnEvent = LogConstants.logOnBlocEvent,
    this.logOnTransition = LogConstants.logOnBlocTransition,
  });

  final bool logOnChange;
  final bool logOnCreate;
  final bool logOnClose;
  final bool logOnError;
  final bool logOnEvent;
  final bool logOnTransition;

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (logOnChange) {
      logD('onChange $change , ${bloc.runtimeType.toString()}');
    }
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    if (logOnCreate) {
      logD('created ${bloc.runtimeType.toString()}');
    }
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    if (logOnClose) {
      logD('closed ${bloc.runtimeType.toString()}');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (logOnError) {
      logE('onError $error ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    if (logOnEvent) {
      logD('onEvent $event ${bloc.runtimeType.toString()}');
    }
  }

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc, Transition<dynamic, dynamic> transition) {
    super.onTransition(bloc, transition);
    if (logOnTransition) {
      logD('onTransition $transition ${bloc.runtimeType.toString()}');
    }
  }
}
