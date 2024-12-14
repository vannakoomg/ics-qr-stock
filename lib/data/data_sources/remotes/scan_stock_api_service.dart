import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sos_mobile/app/base/response/base_data_response.dart';
import 'package:sos_mobile/data/models/scan_stock/asset_model.dart';

part 'scan_stock_api_service.g.dart';

@LazySingleton()
@RestApi()
abstract class ScanStockApiService {
  @FactoryMethod()
  factory ScanStockApiService(Dio dio) = _ScanStockApiService;

  @POST('asset_detail')
  Future<DataResponse<List<AssetModel>>> getAssetDetail(
      {@Body() required AssetInput assetInput});
}

@JsonSerializable(createToJson: false)
class AssetInput {
  AssetInput({
    required this.assetNumber,
  });

  final String assetNumber;

  Map<String, dynamic> toJson() {
    return {
      'params': {
        'asset_number': assetNumber,
      },
    };
  }
}
