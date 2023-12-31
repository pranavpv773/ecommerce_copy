import 'package:ecommerce/module/global_screen/screen/global_screen.dart';
import 'package:ecommerce/module/home/screen/buy_now.dart';
import 'package:ecommerce/module/onboarding/screens/login_screen.dart';
import 'package:ecommerce/module/orders/screen/orders_screen.dart';
import 'package:ecommerce/module/product%20/screens/description_screen.dart';
import 'package:ecommerce/module/product%20/screens/product_screen.dart';
import 'package:ecommerce/module/splash/screens/no_internet/no_internet.dart';
import 'package:ecommerce/module/splash/screens/splash_screen.dart';
import 'package:ecommerce/module/vendor/screen/my_products.dart';
import 'package:ecommerce/utils/apppref.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final url = settings.name;
    final args = settings.arguments;

    switch (url) {
      case "/":
        return pagetransition(settings, const SplashScreen());
      case AppRoutes.loginOrHome:
        return AppPref.userToken != ''
            ? pagetransition(settings, const Landing())
            : pagetransition(settings, const LoginScreen());
      case AppRoutes.landingScreen:
        return pagetransition(settings, const Landing());
      case AppRoutes.noInternetScreen:
        return pagetransition(settings, const NoInternetScreen());
      case AppRoutes.buynowScreen:
        return pagetransition(settings, const BuyNowScreen());
      case AppRoutes.orderScreen:
        return pagetransition(settings, const OrderScreen());
      case AppRoutes.myProductScreen:
        return pagetransition(settings, const MyProducts());
      case AppRoutes.productScreen:
        if (args is Map) {
          return pagetransition(settings, const ProductScreen());
        }
        break;
      case AppRoutes.productDescriptionScreen:
        if (args is Map) {
          return pagetransition(settings, const ProductDescriptionScreen());
        }
        break;
      default:
        return pagetransition(
          settings,
          const SplashScreen(),
        );
    }
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(child: Error()),
            ));
  }

  static PageTransition<dynamic> pagetransition(
      RouteSettings settings, Widget widget) {
    return PageTransition(
      child: widget,
      type: PageTransitionType.fade,
      settings: settings,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
  }

  static PageTransition<dynamic> pagetransitionLeft(
      RouteSettings settings, Widget widget) {
    return PageTransition(
      child: widget,
      type: PageTransitionType.rightToLeft,
      settings: settings,
      duration: const Duration(milliseconds: 100),
      reverseDuration: const Duration(milliseconds: 100),
    );
  }
}

class Error extends StatelessWidget {
  const Error({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text('Oops');
  }
}
