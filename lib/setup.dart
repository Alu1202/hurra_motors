part of 'main.dart';

void restartApp(BuildContext context) {
  final state = context.findAncestorStateOfType<_SetupState>();
  state?.restartApp();
}

class _Setup extends StatefulWidget {
  const _Setup();

  @override
  State<_Setup> createState() => _SetupState();
}

class _SetupState extends State<_Setup> {
  late Key _key;
  late  AppRouter _appRouter;
  @override
  void initState() {
    _key = UniqueKey();
    _appRouter = AppRouter(context);
    super.initState();
  }

  void restartApp() {
    _appRouter.dispose();
    _key = UniqueKey();
    _appRouter = AppRouter(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _App(key: _key, appRouter: _appRouter);
  }
}
