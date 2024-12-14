import 'package:json_annotation/json_annotation.dart';

class LoginResponseEntity {
  const LoginResponseEntity({
    required this.token,
  });

  @JsonKey(name: 'token')
  final String token;
}
