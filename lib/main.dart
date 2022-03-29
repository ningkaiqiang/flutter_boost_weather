import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_boost_weather/search_city/search_city.dart';

void main() {
  PageVisibilityBinding.instance
      .addGlobalObserver(AppGlobalPageVisibilityObserver());
  CustomFlutterBinding();
  runApp(MyApp());
}

class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static Map<String, FlutterBoostRouteFactory> routerMap = {
    'transparentWidget': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          barrierColor: Colors.black12,
          transitionDuration: const Duration(),
          reverseTransitionDuration: const Duration(),
          opaque: false,
          settings: settings,
          pageBuilder: (_, __, ___) => TransparentWidget());
    },
  };
  Route<dynamic>? routeFactory(RouteSettings settings, String? uniqueId) {
    FlutterBoostRouteFactory? func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory, interceptors: [
      // CustomInterceptor1()
      // CustomInterceptor2(),
      CustomInterceptor3()
    ]);
  }
}

// class CustomInterceptor1 extends BoostInterceptor {
//   @override
//   void onPrePush(
//       BoostInterceptorOption option, PushInterceptorHandler handler) {
//     Logger.log('CustomInterceptor#onPrePush1~~~, $option');
//     // Add extra arguments
//     option.arguments!['CustomInterceptor1'] = "1";
//     super.onPrePush(option, handler);
//   }
//
//   @override
//   void onPostPush(
//       BoostInterceptorOption option, PushInterceptorHandler handler) {
//     Logger.log('CustomInterceptor#onPostPush1~~~, $option');
//     handler.next(option);
//   }
// }

// class CustomInterceptor2 extends BoostInterceptor {
//   @override
//   void onPrePush(
//       BoostInterceptorOption option, PushInterceptorHandler handler) {
//     Logger.log('CustomInterceptor#onPrePush2~~~, $option');
//     // Add extra arguments
//     option.arguments!['CustomInterceptor2'] = "2";
//
//     if (!option.isFromHost! && option.name == "interceptor") {
//       handler.resolve(<String, dynamic>{'result': 'xxxx'});
//     } else {
//       handler.next(option);
//     }
//   }
//
//   @override
//   void onPostPush(
//       BoostInterceptorOption option, PushInterceptorHandler handler) {
//     Logger.log('CustomInterceptor#onPostPush2~~~, $option');
//     handler.next(option);
//   }
// }

class CustomInterceptor3 extends BoostInterceptor {
  @override
  void onPrePush(
      BoostInterceptorOption option, PushInterceptorHandler handler) {
    Logger.log('CustomInterceptor#onPrePush3~~~, $option');
    // Replace arguments
    // option.arguments = <String, dynamic>{'CustomInterceptor3': '3'};
    handler.next(option);
  }

  @override
  void onPostPush(
      BoostInterceptorOption option, PushInterceptorHandler handler) {
    Logger.log('CustomInterceptor#onPostPush3~~~, $option');
    handler.next(option);
  }
}

class AppGlobalPageVisibilityObserver extends GlobalPageVisibilityObserver {
  @override
  void onPagePush(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageCreate route:${route.settings.name}');
  }

  @override
  void onPageShow(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageShow route:${route.settings.name}');
  }

  @override
  void onPageHide(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageHide route:${route.settings.name}');
  }

  @override
  void onPagePop(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onPageDestroy route:${route.settings.name}');
  }

  @override
  void onForeground(Route route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onForeground route:${route.settings.name}');
  }

  @override
  void onBackground(Route<dynamic> route) {
    Logger.log(
        'boost_lifecycle: AppGlobalPageVisibilityObserver.onBackground route:${route.settings.name}');
  }
}

class BoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('boost-didPush' + route.settings.name!);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('boost-didPop' + route.settings.name!);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('boost-didRemove' + route.settings.name!);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('boost-didStartUserGesture' + route.settings.name!);
  }
}