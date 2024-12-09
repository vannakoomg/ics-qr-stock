part of 'login_bloc.dart';

class LoginEvent extends BaseEvent {}

@freezed
class UserNameChange extends LoginEvent with _$UserNameChange {
  factory UserNameChange(String value) = _UserNameChange;
}

@freezed
class PasswordChange extends LoginEvent with _$PasswordChange {
  factory PasswordChange(String value) = _PasswordChange;
}

@freezed
class ClickButtonLogin extends LoginEvent with _$ClickButtonLogin {
  factory ClickButtonLogin() = _ClickButtonLogin;
}

@freezed
class TogglePasswordVisibility extends LoginEvent
    with _$TogglePasswordVisibility {
  factory TogglePasswordVisibility() = _TogglePasswordVisibility;
}
