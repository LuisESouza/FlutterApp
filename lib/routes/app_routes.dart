import 'package:flutter/material.dart';
import '../views/forgot_password.dart';
import '../views/login.dart';
import '../views/register.dart';
import '../views/set_password.dart';
import '../views/onboarding/onboarding_screens.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const MyHomePageState(title: 'Log In'),
    '/register': (context) => const MyRegisterPage(title: 'Create Account'),
    '/forgot-password': (context) => const ForgotPasswordPage(title: 'Forgot Password'),
    '/set-password': (context) => const MySetPasswordPage(title: 'Set Password'),
    '/onboarding': (context) => const OnboardingScreens(),
  };
}
