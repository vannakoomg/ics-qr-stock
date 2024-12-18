import 'package:injectable/injectable.dart';
import 'package:sos_mobile/app/base/usecase/base_use_case.dart';
import 'package:sos_mobile/data/data_sources/remotes/scan_stock_api_service.dart';
import 'package:sos_mobile/features/scan_stock/domain/repository/scan_stock_repository.dart';

@Injectable()
class RemarkAssetUsecase extends BaseUseCase<RemarkInput, void> {
  final ScanStockRepository _repository;
  RemarkAssetUsecase(this._repository);
  @override
  Future<void> excecute(RemarkInput input) async {
    await _repository.remarkAsset(input);
  }
}
