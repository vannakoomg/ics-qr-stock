import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_entity.freezed.dart';

@freezed
class AssetEntity with _$AssetEntity {
  factory AssetEntity({
    int? id,
    String? name,
    String? description_in_khmer,
    String? asset_number,
    String? image,
    bool? isRemark,
    String? remark,
  }) = _AssetEntity;
}
