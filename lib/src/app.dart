import 'package:flutter/material.dart';
import 'package:navigation_system/navigation_system.dart';
import 'view/auth/onboarding_view/onboarding_view.dart';
import 'view/auth/splash_view/splash_screen_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
      onGenerateRoute: 
      (RouteSettings routeSettings) => NavigationSystem(
        initialRoute: const SplashScreenView(),
        routes: {
          SplashScreenView.routeName: (context, args) =>
              const SplashScreenView(),
               OnboardingView.routeName: (context, args) =>
              const OnboardingView(),
        },
      ).generateRoute(routeSettings));
    
      });
      }
  
}
