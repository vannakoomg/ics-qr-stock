part of 'scan_stock_bloc.dart';

class ScanStockEvent extends BaseEvent {}

@freezed
class ClickChangeLanguage extends ScanStockEvent with _$ClickChangeLanguage {
  factory ClickChangeLanguage() = _ClickChangeLanguage;
}

@freezed
class ClickChangeMode extends ScanStockEvent with _$ClickChangeMode {
  factory ClickChangeMode() = _ClickChangeMode;
}

@freezed
class GetAssets extends ScanStockEvent with _$GetAssets {
  factory GetAssets(String id) = _GetAssets;
}

@freezed
class ClickLogout extends ScanStockEvent with _$ClickLogout {
  factory ClickLogout() = _ClickLogout;
}

@freezed
class ClickConfrim extends ScanStockEvent with _$ClickConfrim {
  factory ClickConfrim(String remark, bool isVerify) = _ClickConfrim;
}

@freezed
class RemarkChangedEvent extends ScanStockEvent with _$RemarkChangedEvent {
  factory RemarkChangedEvent(String remark) = _RemarkChangedEvent;
}

@freezed
class ClickCampus extends ScanStockEvent with _$ClickCampus {
  factory ClickCampus() = _ClickCampus;
}

@freezed
class ClickOutSide extends ScanStockEvent with _$ClickOutSide {
  factory ClickOutSide() = _ClickOutSide;
}

@freezed
class ClickSelectCampus extends ScanStockEvent with _$ClickSelectCampus {
  factory ClickSelectCampus(String campus) = _ClickSelectCampus;
}

@freezed
class RoomChanged extends ScanStockEvent with _$RoomChanged {
  factory RoomChanged(String value) = _RoomChanged;
}

@freezed
class DescKhChanged extends ScanStockEvent with _$DescKhChanged {
  factory DescKhChanged(String value) = _DescKhChanged;
}

@freezed
class DescEnChanged extends ScanStockEvent with _$DescEnChanged {
  factory DescEnChanged(String value) = _DescEnChanged;
}

@freezed
class ClickQuality extends ScanStockEvent with _$ClickQuality {
  factory ClickQuality() = _ClickQuality;
}

@freezed
class ClickSelectQuality extends ScanStockEvent with _$ClickSelectQuality {
  factory ClickSelectQuality(String quality) = _ClickSelectQuality;
}

@freezed
class TabTextfile extends ScanStockEvent with _$TabTextfile {
  factory TabTextfile() = _TabTextfile;
}

@freezed
class GetRemarkBig extends ScanStockEvent with _$GetRemarkBig {
  factory GetRemarkBig(String value) = _GetRemarkBig;
}
