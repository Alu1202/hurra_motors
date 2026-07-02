import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/router/routes_helper.dart';
import 'components/serivces_grid.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToCreateNewJobScreen(context);
        },

        label: const Text('New Job'),
        icon: const Icon(Icons.edit_document),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ServicesGrid(),
        ),
      ),
    );
  }
}
