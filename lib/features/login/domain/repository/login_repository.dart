import 'package:sos_mobile/features/login/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<LoginResponseEntity> login({
    required String email,
    required String password,
  });
}
