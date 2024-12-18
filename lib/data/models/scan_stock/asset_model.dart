import 'package:json_annotation/json_annotation.dart';
import 'package:sos_mobile/features/scan_stock/domain/entities/asset_entity.dart';

part 'asset_model.g.dart';

@JsonSerializable(createToJson: false)
class AssetModel {
  AssetModel(
      {required this.name,
      required this.description_in_khmer,
      required this.asset_number,
      required this.image,
      required this.id,
      required this.isRemark,
      required this.remark});

  final int? id;
  final String? name;
  final String? description_in_khmer;
  final String? asset_number;
  final String? image;
  final String? remark;
  final bool? isRemark;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
}

/// Map to Entity
extension AssetModelToEntity on AssetModel {
  AssetEntity toEntity() => AssetEntity(
      id: id,
      asset_number: asset_number,
      image: image,
      description_in_khmer: description_in_khmer,
      name: name,
      isRemark: isRemark ?? false,
      remark: remark ?? "");
}

extension AssetModelToListEntity on List<AssetModel> {
  List<AssetEntity> toListEntity() => map((model) => model.toEntity()).toList();
}
