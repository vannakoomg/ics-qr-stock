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
      required this.campus,
      required this.room,
      required this.updated_by,
      required this.status_datetime,
      required this.count_status,
      required this.remark,
      required this.quality});

  final int? id;
  final String? name;
  final String? description_in_khmer;
  final String? asset_number;
  final String? image;
  final String? status_datetime;
  final String? remark;
  final String? updated_by;
  final bool? count_status;
  final String? room;
  final String? campus;
  final String? quality;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
}

/// Map to Entity
extension AssetModelToEntity on AssetModel {
  AssetEntity toEntity() => AssetEntity(
      id: id,
      updated_by: updated_by ?? "",
      status_datetime: status_datetime ?? "",
      asset_number: asset_number ?? "",
      image: image,
      quality: quality ?? "",
      description_in_khmer: description_in_khmer ?? "",
      name: name ?? "",
      campus: campus ?? "",
      room: room ?? "",
      count_status: count_status ?? false,
      remark: remark ?? "");
}

extension AssetModelToListEntity on List<AssetModel> {
  List<AssetEntity> toListEntity() => map((model) => model.toEntity()).toList();
}
