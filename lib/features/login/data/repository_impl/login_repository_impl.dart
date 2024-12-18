import 'package:injectable/injectable.dart';

import '../../domain/repository/login_repository.dart';
import '../data_sources/remote/login_api_service.dart';
import '../model/login_model.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this._loginApiService);

  final LoginApiService _loginApiService;

  @override
  Future<List<LoginModel>> login({
    required String username,
    required String password,
  }) async {
    final login = await _loginApiService.login(
      loginInput: LoginInput(
        username: username,
        password: password,
      ),
    );
    return login.data;
  }
}
