import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../extensions/context_ext.dart';
import 'base_bloc.dart';
import 'base_state.dart';
import 'ui_action.dart';

class BaseScreen<B extends BaseBloc<S>, S extends BaseState>
    extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.create,
    required this.appBar,
    required this.builder,
    this.actions,
    this.floatingActionButton,
  });

  final B Function(BuildContext context) create;
  final PreferredSizeWidget appBar;

  final Widget Function(BuildContext context) builder;

  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: create,
      child: BlocListener<B, S>(
        listener: (context, state) async {
          final action = state.action;
          context.read<B>();
          switch (action) {
            case ShowSnackBarAction():
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(action.message)));
            case NavigateAction():
              if (action.replace) {
                context.router.replace(action.route);
              } else {
                context.router.push(action.route);
              }
            case PopAction():
              context.router.pop();

            case ShowDialogAction():
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(action.title),
                  content: Text(action.message),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );

            default:
              break;
          }
        },
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                Scaffold(
                  appBar: appBar,
                  floatingActionButton: floatingActionButton,
                  body: builder(context),
                ),

                BlocBuilder<B, S>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Container(
                        color: context.theme.colorScheme.surfaceTint,
                        child:  Center(child: CircularProgressIndicator(
                          color: context.theme.colorScheme.primary
                        )),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
