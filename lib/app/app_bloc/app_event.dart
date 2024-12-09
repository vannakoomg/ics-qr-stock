part of 'app_bloc.dart';

@freezed
class AppEvent extends BaseEvent with _$AppEvent {
  const factory AppEvent.started() = _Started;
  const factory AppEvent.onCachedError(Object error) = _OnCachedError;
}
