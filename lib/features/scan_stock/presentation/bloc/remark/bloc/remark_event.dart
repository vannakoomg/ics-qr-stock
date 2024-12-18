part of 'remark_bloc.dart';

class RemarkEvent extends BaseEvent {}

@freezed
class RemarkChanged extends RemarkEvent with _$RemarkChanged {
  factory RemarkChanged(String value) = _RemarkChanged;
}

@freezed
class ClickRemarkButton extends RemarkEvent with _$ClickRemarkButton {
  factory ClickRemarkButton() = _ClickRemarkButton;
}

@freezed
class InitPage extends RemarkEvent with _$InitPage {
  factory InitPage(String value) = _InitPage;
}
