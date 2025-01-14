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
  @POST('asset_update')
  Future<void> remarkAsset({@Body() required VerifyInpust VerifyInpust});
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

@JsonSerializable(createToJson: false)
class VerifyInpust {
  VerifyInpust(
      {required this.remark,
      required this.assetId,
      required this.updateAt,
      required this.campus,
      required this.description_in_khmer,
      required this.name,
      required this.quality,
      required this.room,
      required this.updated_by,
      required this.isVerify});

  final String remark;
  final String assetId;
  final String updateAt;
  final bool isVerify;
  final int updated_by;
  final String campus;
  final String name;
  final String description_in_khmer;
  final String room;
  final String quality;

  Map<String, dynamic> toJson() {
    return {
      'params': {
        "asset_number": assetId,
        "status": isVerify,
        "remark": remark,
        "updated_on": updateAt,
        "updated_by": updated_by,
        "room": room,
        "quality": quality,
        "description_in_khmer": description_in_khmer,
        "name": name,
        "campus": campus
      },
    };
  }
}
