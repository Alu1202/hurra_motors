part of 'main.dart';

class _App extends StatefulWidget {
  const _App({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final colorScheme = brightness == Brightness.light
        ? MaterialTheme.lightScheme()
        : MaterialTheme.darkScheme();
    final textTheme = createTextTheme(
      bodyFont: 'Inter',
      displayFont: 'Poppins',
      textColor: Colors.black,
      colorScheme: colorScheme,
    );
    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp.router(
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: widget.appRouter.config(),
    );
  }
}
