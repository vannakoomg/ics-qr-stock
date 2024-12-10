import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/base/bloc/bloc.dart';

part 'scan_stock_event.dart';
part 'scan_stock_state.dart';
part 'scan_stock_bloc.freezed.dart';

@Injectable()
class ScanStockBloc extends BaseBloc<ScanStockEvent, ScanStockState> {
  ScanStockBloc() : super(const _Initial()) {
    // on<ScanStockEvent>(_onScanStockEvent);
  }
}
