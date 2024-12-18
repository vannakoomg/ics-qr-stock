import 'package:sos_mobile/features/login/domain/entity/login_entity.dart';

abstract class LoginRepository {
  Future<List<LoginResponseEntity>> login({
    required String username,
    required String password,
  });
}
