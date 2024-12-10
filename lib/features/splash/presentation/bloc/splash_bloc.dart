import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/base/bloc/bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

@Injectable()
class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc() : super(const _Initial()) {
    // on<SplashEvent>(_onSplashEvent);
  }
}
