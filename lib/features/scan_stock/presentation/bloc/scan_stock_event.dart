
part of 'scan_stock_bloc.dart';

@freezed
class ScanStockEvent extends BaseEvent with _$ScanStockEvent {
  const factory ScanStockEvent.started() = _Started;
}