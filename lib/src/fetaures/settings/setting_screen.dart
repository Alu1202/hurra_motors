import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});
  static const route = '/login';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.restart_alt_rounded),
            title: const Text('Restart App'),
            onTap: () {
              restartApp(context);
            },
          ),
        ],
      ),
    );
  }
}
