import 'ui_action.dart';

class BaseState {
  const BaseState({this.isLoading = false, this.action = const NoAction()});
  final bool isLoading;
  final UiAction action;

  BaseState copyWith({bool? isLoading, UiAction action = const NoAction()}) {
    return BaseState(isLoading: isLoading ?? this.isLoading, action: action);
  }
}
