import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/chat/presentation/pages/chat_list_screen.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/settings/presentation/pages/settings_screen.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/user/presentation/pages/user_screen.dart';
import 'package:shop_best_project/src/features/main_user_flow/presentation/pages/user_flow_screen.dart';
import 'package:shop_best_project/src/features/main_user_flow/features/product/presentation/pages/product_screen.dart';

GoRouter router = GoRouter(
  initialLocation: ProductScreen.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          UserFlowScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
                path: ProductScreen.path,
                name: ProductScreen.name,
                builder: (context, state) => ProductScreen(),
                pageBuilder: GoTransitions.fade.call),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ChatListScreen.path,
              name: ChatListScreen.name,
              builder: (context, state) => ChatListScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
        path: UserScreen.path,
        name: UserScreen.name,
        builder: (context, state) => UserScreen(),
        routes: [
          GoRoute(
            path: SettingsScreen.path,
            name: SettingsScreen.name,
            builder: (context, state) => SettingsScreen(),
          )
        ])
  ],
);
