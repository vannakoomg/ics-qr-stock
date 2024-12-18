import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sos_mobile/app/base/response/base_data_response.dart';
import 'package:sos_mobile/features/login/data/model/login_model.dart';

part 'login_api_service.g.dart';

@LazySingleton()
@RestApi()
abstract class LoginApiService {
  @FactoryMethod()
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST('authenticate')
  Future<DataResponse<List<LoginModel>>> login(
      {@Body() required LoginInput loginInput});
}

@JsonSerializable(createToJson: false)
class LoginInput {
  LoginInput({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'params': {
        'username': username,
        'password': password,
      },
    };
  }
}
