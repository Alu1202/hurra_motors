import '../../core/base/base_event.dart';

abstract class LoginEvent extends BaseEvent {
  const LoginEvent();
}

class ClearUiAction extends LoginEvent {
  const ClearUiAction();
}

class UserIdChanged extends LoginEvent {
  final String? value;
  const UserIdChanged(this.value);
}

class PasswordChanged extends LoginEvent {
  final String? value;
  const PasswordChanged(this.value);
}

class TogglePasswordVisibility extends LoginEvent {
  const TogglePasswordVisibility();
}

class LoginPressed extends LoginEvent {
  const LoginPressed();
}
