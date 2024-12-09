import 'package:injectable/injectable.dart';

import 'package:sos_mobile/app/base/usecase/base_use_case.dart';
import 'package:sos_mobile/features/login/domain/entity/login_entity.dart';
import 'package:sos_mobile/features/login/domain/repository/login_repository.dart';

@Injectable()
class LoginUseCase implements BaseUseCase<LoginInput, LoginResponseEntity> {
  LoginUseCase(this._loginRepository);

  final LoginRepository _loginRepository;

  @override
  Future<LoginResponseEntity> excecute(LoginInput input) async {
    final output = await _loginRepository.login(
      email: input.email,
      password: input.password,
    );

    return output;
  }
}

class LoginInput {
  final String email;
  final String password;
  LoginInput({
    required this.email,
    required this.password,
  });
}

// class AuthUseCase with LoginUseCase, LogoutUseCase {
//   AuthUseCase(super.loginRepository);
// }

// testIt() {
//   final AuthUseCase authUseCase =
//       AuthUseCase(LoginRepositoryImpl(LoginApiService(Dio())));
// }
