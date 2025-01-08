import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/login_entity.dart';

part 'login_model.g.dart';

@JsonSerializable(createToJson: false)
class LoginModel extends LoginResponseEntity {
  const LoginModel({required super.token, required super.userId});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
