// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MainView());
    },
    HomeViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    PostsNamespaceRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HeroEmptyRouterPage());
    },
    AccountViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const AccountView());
    },
    PostsViewRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const PostsView());
    },
    PostDetailViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostDetailViewRouteArgs>(
          orElse: () =>
              PostDetailViewRouteArgs(postId: pathParams.getString('id')));
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: PostDetailView(key: args.key, postId: args.postId));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MainViewRoute.name, path: '/', children: [
          RouteConfig(HomeViewRoute.name, path: '', parent: MainViewRoute.name),
          RouteConfig(PostsNamespaceRoute.name,
              path: 'posts',
              parent: MainViewRoute.name,
              children: [
                RouteConfig(PostsViewRoute.name,
                    path: '', parent: PostsNamespaceRoute.name),
                RouteConfig(PostDetailViewRoute.name,
                    path: ':id', parent: PostsNamespaceRoute.name)
              ]),
          RouteConfig(AccountViewRoute.name,
              path: 'account', parent: MainViewRoute.name)
        ])
      ];
}

/// generated route for
/// [MainView]
class MainViewRoute extends PageRouteInfo<void> {
  const MainViewRoute({List<PageRouteInfo>? children})
      : super(MainViewRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainViewRoute';
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute() : super(HomeViewRoute.name, path: '');

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [HeroEmptyRouterPage]
class PostsNamespaceRoute extends PageRouteInfo<void> {
  const PostsNamespaceRoute({List<PageRouteInfo>? children})
      : super(PostsNamespaceRoute.name,
            path: 'posts', initialChildren: children);

  static const String name = 'PostsNamespaceRoute';
}

/// generated route for
/// [AccountView]
class AccountViewRoute extends PageRouteInfo<void> {
  const AccountViewRoute() : super(AccountViewRoute.name, path: 'account');

  static const String name = 'AccountViewRoute';
}

/// generated route for
/// [PostsView]
class PostsViewRoute extends PageRouteInfo<void> {
  const PostsViewRoute() : super(PostsViewRoute.name, path: '');

  static const String name = 'PostsViewRoute';
}

/// generated route for
/// [PostDetailView]
class PostDetailViewRoute extends PageRouteInfo<PostDetailViewRouteArgs> {
  PostDetailViewRoute({Key? key, required String postId})
      : super(PostDetailViewRoute.name,
            path: ':id',
            args: PostDetailViewRouteArgs(key: key, postId: postId),
            rawPathParams: {'id': postId});

  static const String name = 'PostDetailViewRoute';
}

class PostDetailViewRouteArgs {
  const PostDetailViewRouteArgs({this.key, required this.postId});

  final Key? key;

  final String postId;

  @override
  String toString() {
    return 'PostDetailViewRouteArgs{key: $key, postId: $postId}';
  }
}
