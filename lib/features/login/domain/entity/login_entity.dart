import 'package:json_annotation/json_annotation.dart';

class LoginResponseEntity {
  const LoginResponseEntity({required this.token, required this.userId});

  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'user_id')
  final int userId;
}
