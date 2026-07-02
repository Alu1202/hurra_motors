import '../../core/base/base_state.dart';
import '../../core/base/ui_action.dart';

class LoginState extends BaseState {
  const LoginState({
    super.isLoading,
    super.action,
    this.userId,
    this.password,
    this.isPasswordVisible = false,
  });
  final String? userId;
  final String? password;
  final bool isPasswordVisible;


  @override
  LoginState copyWith({
    bool? isLoading,
    UiAction action = const NoAction(),
    String? userId,
    String? password,
    bool? isPasswordVisible,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      action: action,
      userId: userId ?? this.userId,
      password: password ?? this.password ,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
