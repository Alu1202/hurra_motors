import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../core/router/routes_helper.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const route = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      replaceGoToLoginScreen(context);
    });
  }

  @override
  void initState() {
    onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HURRA MOTORS', style: context.textTheme.headlineMedium),
            const Spacer(),
            const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 16),
            Text('Loading...', style: context.bodyMediumOnPrimary),
            const Spacer(),
            Text(
              'Simple . Fast . Reliable',
              style: context.theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
