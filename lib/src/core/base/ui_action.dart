import 'package:auto_route/auto_route.dart';

abstract class UiAction {
  const UiAction();
}

class NoAction extends UiAction {
  const NoAction();
}


class ShowSnackBarAction extends UiAction {
  const ShowSnackBarAction(this.message, {this.isError = false});
  final String message;
  final bool isError;
}

class ShowDialogAction extends UiAction {
  const ShowDialogAction({required this.title, required this.message});
  final String title;
  final String message;
}

class NavigateAction extends UiAction {
  const NavigateAction({required this.route, this.replace = true});
  final PageRouteInfo route;
  final bool replace;
}

class PopAction extends UiAction {
  const PopAction();
}
