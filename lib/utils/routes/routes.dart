import 'package:flutter/material.dart';

import '../../utils/routes/routes_name.dart';
import '../../view/dashboard.dart';
import '../../view/free_tip/free_tip.dart';
import '../../view/login_view.dart';
import '../../view/otp_verify.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    final argume = settings.arguments;
    switch (settings.name) {
      // case RoutesName.home:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.otpVerify:
        return MaterialPageRoute(
            builder: (BuildContext context) => OTPVerify(argume));
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.dashboard:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Dashboard());
      case RoutesName.freeTip:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FreeTip());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('NO route defined')),
          );
        });
    }
  }
}
