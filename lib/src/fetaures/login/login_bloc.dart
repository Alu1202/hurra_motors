import '../../core/base/base_bloc.dart';
import '../../core/base/ui_action.dart';
import '../../core/router/app_router.gr.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends BaseBloc<LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<ClearUiAction>((event, emit) {
      emit(state.copyWith());
    });

    on<UserIdChanged>((event, emit) {
      emit(state.copyWith(userId: event.value));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.value));
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<LoginPressed>((event, emit) async {
      // final userId = state.userId?.trim() ?? '';
      // final password = state.password?.trim() ?? '';

      // if (userId.isEmpty) {
      //   emit(
      //     state.copyWith(
      //       action: const ShowSnackBarAction(
      //         'User ID is required',
      //         isError: true,
      //       ),
      //     ),
      //   );
      //   return;
      // }

      // if (password.isEmpty) {
      //   emit(
      //     state.copyWith(
      //       action: const ShowSnackBarAction(
      //         'Password is required',
      //         isError: true,
      //       ),
      //     ),
      //   );
      //   return;
      // }

      // emit(state.copyWith(isLoading: true));

      // await Future.delayed(const Duration(seconds: 1));

      emit(
        state.copyWith(
          isLoading: false,
          action: const ShowSnackBarAction('Login Successful'),
        ),
      );
      emit(state.copyWith(action: const NavigateAction(route: DashboardRoute())));
    });
  }
}
