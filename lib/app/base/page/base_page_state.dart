import 'package:flutter/material.dart';

import '../../../di/di.dart';
import '../../../core/utils/log/log_utils.dart';
import '../navigation/app_navigator.dart';

abstract class BasePageState<T extends StatefulWidget>
    extends BasePageStateDelegate<T> with LogMixin {}

abstract class BasePageStateDelegate<T extends StatefulWidget>
    extends State<T> {
  late final appRoute = getIt.get<IAppNavigator>();
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

  // late final B bloc = getIt.get<B>()
  //   ..navigator = navigator
  //   ..disposeBag = disposeBag
  //   ..appBloc = appBloc
  //   ..commonBloc = commonBloc
  //   ..exceptionHandler = exceptionHandler
  //   ..exceptionMessageMapper = exceptionMessageMapper;

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

  // Widget buildPage(BuildContext context);

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
