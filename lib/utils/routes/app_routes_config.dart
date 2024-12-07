
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../view/dash_board_screen.dart';
import '../../view/home_screen.dart';
import '../../view/login_screen.dart';
import '../../view/otp_screen.dart';
import '../../view/projects_screen.dart';
import '../../view/sign_up_screen.dart';
import '../../view/target_screen.dart';
import '../../view/wallet_screen.dart';
import 'app_routes.dart';

class MyAppRouter {
  final GoRouter router = GoRouter(
    initialLocation: "/otp",

    routes: [
      GoRoute(
        name: AppRoutesConstant.homeRouteName,
        path: "/home",
        pageBuilder: (context, state) {
          return const MaterialPage(child: HomeScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.dashBoardRouteName,
        path: "/dash_board",
        pageBuilder: (context, state) {
          return const MaterialPage(child: DashBoardScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.signInRouteName,
        path: "/sign_in",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignInScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.signUpRouteName,
        path: "/sign_up",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignUpScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.otpRouteName,
        path: "/otp",
        pageBuilder: (context, state) {
          return const MaterialPage(child: OTPScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.projectsRouteName,
        path: "/projects",
        pageBuilder: (context, state) {
          return const MaterialPage(child: ProjectsScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.targetRouteName,
        path: "/target",
        pageBuilder: (context, state) {
          return const MaterialPage(child: TargetScreen());
        },
      ),
      GoRoute(
        name: AppRoutesConstant.walletRouteName,
        path: "/wallet",
        pageBuilder: (context, state) {
          return const MaterialPage(child: WalletScreen());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: Center(child: Text("No route found"),));
    },
  );
}