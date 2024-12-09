import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sos_mobile/features/login/data/model/login_model.dart';

part 'login_api_service.g.dart';

@LazySingleton()
@RestApi()
abstract class LoginApiService {
  @FactoryMethod()
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST('login')
  Future<LoginModel> login({@Body() required LoginInput loginInput});

  @POST('register')
  Future<LoginModel> signup({@Body() required LoginInput loginInput});
}

@JsonSerializable(createToJson: true)
class LoginInput {
  LoginInput({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}
