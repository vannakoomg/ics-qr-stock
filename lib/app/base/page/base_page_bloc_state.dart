import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sos_mobile/app/app_bloc/app_bloc.dart';
import 'package:sos_mobile/app/base/bloc/base_bloc.dart';
import 'package:sos_mobile/config/exceptions/app_exception.dart';
import 'package:sos_mobile/core/helper/local_data/storge_local.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/log/log_utils.dart';
import '../../../di/di.dart';
import '../navigation/app_navigator.dart';

abstract class BasePageBlocState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageBlocStateDelegate<T, B> with LogMixin {}

abstract class BasePageBlocStateDelegate<T extends StatefulWidget,
    B extends BaseBloc> extends State<T> with AutomaticKeepAliveClientMixin {
  bool get isUser =>
      LocalStorage.getStringValue(SharedPreferenceKeys.accessToken)
          .trim()
          .isNotEmpty;

  /// Navigation
  IAppNavigator get appRoute => getIt.get<IAppNavigator>();

  late final bool globalBloc = false;

  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        if (!globalBloc) BlocProvider(create: (_) => bloc),
        BlocProvider(create: (_) => appBloc),
      ],
      child: BlocListener<AppBloc, AppState>(
        listenWhen: (previous, current) => previous != current,
        listener: (_, state) {
          // print('work state');
          // print(state);
          _handleError(state);
        },
        child: buildPage(context),
      ),
    );
  }

  // show loading dialog only for this screen
  void showdialogLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  // hide loading dialog
  void hideLoading() {
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  // late final appBloc = getIt.get<AppBloc>();
  // late final exceptionMessageMapper = const ExceptionMessageMapper();
  // late final exceptionHandler = ExceptionHandler(
  //   navigator: navigator,
  //   listener: this,
  // );

  // late final commonBloc = getIt.get<CommonBloc>()
  //   ..navigator = navigator
  //   ..disposeBag = disposeBag
  //   ..appBloc = appBloc
  //   ..exceptionHandler = exceptionHandler
  //   ..exceptionMessageMapper = exceptionMessageMapper;

  dynamic get param1 => null;

  late final B bloc =
      (globalBloc ? BlocProvider.of<B>(context) : getIt.get<B>(param1: param1))
        ..appRoute = appRoute
        ..appBloc = appBloc;

  late final AppBloc appBloc = getIt.get<AppBloc>()..appRoute = appRoute;
  // ..disposeBag = disposeBag
  // ..appBloc = appBloc
  // ..commonBloc = commonBloc
  // ..exceptionHandler = exceptionHandler
  // ..exceptionMessageMapper = exceptionMessageMapper;

  // late final DisposeBag disposeBag = DisposeBag();

  // bool get isAppWidget => false;

  // @override
  // Widget build(BuildContext context) {
  //   if (!isAppWidget) {
  //     AppDimen.of(context);
  //     AppColors.of(context);
  //   }

  //   return Provider(
  //     create: (context) => navigator,
  //     child: MultiBlocProvider(
  //       providers: [
  //         BlocProvider(create: (_) => bloc),
  //         BlocProvider(create: (_) => commonBloc),
  //       ],
  //       child: BlocListener<CommonBloc, CommonState>(
  //         listenWhen: (previous, current) =>
  //             previous.appExceptionWrapper != current.appExceptionWrapper &&
  //             current.appExceptionWrapper != null,
  //         listener: (context, state) {
  //           handleException(state.appExceptionWrapper!);
  //         },
  //         child: buildPageListeners(
  //           child: isAppWidget
  //               ? buildPage(context)
  //               : Stack(
  //                   children: [
  //                     buildPage(context),
  //                     BlocBuilder<CommonBloc, CommonState>(
  //                       buildWhen: (previous, current) =>
  //                           previous.isLoading != current.isLoading,
  //                       builder: (context, state) => Visibility(
  //                         visible: state.isLoading,
  //                         child: buildPageLoading(),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildPageListeners({required Widget child}) => child;

  // Widget buildPageLoading() => Center(
  //       child: Container(
  //         width: double.infinity,
  //         height: double.infinity,
  //         color: Colors.black12.withOpacity(0.4),
  //         child: const Center(child: LoadingWhiteWidget()),
  //       ),
  //     );

  Widget buildPage(BuildContext context);

  void _handleError(AppState state) {
    final error = state.error;
    if (error != null) {
      if (error is AppException) {
        final AppExceptionType appExceptionType = error.exceptionType;
        switch (appExceptionType) {
          // case AppExceptionType.service:
          //   appRoute.showDialog(
          //       const AppPopupInfo.errorDialog(message: 'Session Expired!'));
          //   break;

          default:
            break;
        }
      }
    }
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   disposeBag.dispose();
  // }

  // void handleException(AppExceptionWrapper appExceptionWrapper) {
  //   exceptionHandler
  //       .handleException(
  //     appExceptionWrapper,
  //     handleExceptionMessage(appExceptionWrapper.appException),
  //   )
  //       .then((value) {
  //     appExceptionWrapper.exceptionCompleter?.complete();
  //   });
  // }

  // String handleExceptionMessage(AppException appException) {
  //   return exceptionMessageMapper.map(appException);
  // }

  // @override
  // void onRefreshTokenFailed() {
  //   commonBloc.add(const ForceLogoutButtonPressed());
  // }
}
