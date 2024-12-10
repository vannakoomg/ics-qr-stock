part of 'splash_bloc.dart';

class SplashEvent extends BaseEvent {}

@freezed
class InitEvent extends SplashEvent with _$InitEvent {
  factory InitEvent() = _InitEvent;
}
