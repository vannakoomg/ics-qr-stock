import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_entity.freezed.dart';

@freezed
class AssetEntity with _$AssetEntity {
  factory AssetEntity({
    int? id,
    @Default('') String name,
    @Default('') String description_in_khmer,
    @Default('') String asset_number,
    @Default('') String room,
    @Default('') String campus,
    String? image,
    @Default('') String status_datetime,
    @Default('') String updated_by,
    bool? count_status,
    @Default('') String remark,
    @Default('') String quality,
  }) = _AssetEntity;
}
