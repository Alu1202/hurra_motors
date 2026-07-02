import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

void replaceGoToLoginScreen(BuildContext context) {
  context.router.replace(const LoginRoute());
}

void goToDashboardScreen(BuildContext context) {
  context.router.replace(const DashboardRoute());
}

void goToCreateNewJobScreen(BuildContext context) {
  context.router.push(const CreateNewJobRoute());
}