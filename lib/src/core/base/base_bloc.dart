import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event.dart';
import 'base_state.dart';
import 'ui_action.dart';

abstract class BaseBloc<S extends BaseState> extends Bloc<BaseEvent, S> {
  BaseBloc(super.initialState) {
    on<ClearUiAction>((event, emit) {
      emit(state.copyWith() as S);
    });
  }

  void showLoading(bool value, Emitter<S> emit) {
    emit(state.copyWith(isLoading: value) as S);
  }

  void showSnackBar(String message, Emitter<S> emit, {bool isError = false}) {
    addAction(ShowSnackBarAction(message, isError: isError), emit);
  }

  void showDialog(String title, String message, Emitter<S> emit) {
    addAction(ShowDialogAction(title: title, message: message), emit);
  }

  void clearActions(Emitter<S> emit) {
    addAction(const NoAction(), emit);
  }

  void addAction(UiAction action, Emitter<S> emit) {
    emit(state.copyWith(action: action) as S);
  }
}
