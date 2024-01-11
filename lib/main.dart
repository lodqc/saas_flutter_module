import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:saas_flutter_module/amap.dart';
import 'package:saas_flutter_module/net/dio_utils.dart';
import 'package:saas_flutter_module/net/intercept.dart';
import 'package:saas_flutter_module/plugins/pigeon_out.dart';
import 'package:saas_flutter_module/provider/theme_provider.dart';
import 'package:saas_flutter_module/res/constant.dart';
import 'package:saas_flutter_module/router/not_found_page.dart';
import 'package:saas_flutter_module/router/routers.dart';
import 'package:saas_flutter_module/util/handle_error_utils.dart';
import 'package:saas_flutter_module/util/log_utils.dart';
import 'package:saas_flutter_module/withdraw/award_withdrawal_page.dart';
import 'package:sp_util/sp_util.dart';
import 'package:url_strategy/url_strategy.dart';

@pragma('vm:entry-point')
void aMapPage() => runApp(AMapPage());

@pragma('vm:entry-point')
void withdrawPage() => initApp(AwardWithdrawalPage());

Future<void> main() async {
  initApp(AwardWithdrawalPage());
}

initApp(Widget initPage) {
  /// 异常处理
  handleError(() async {
    /// 确保初始化完成
    WidgetsFlutterBinding.ensureInitialized();

    /// 去除URL中的“#”(hash)，仅针对Web。默认为setHashUrlStrategy
    /// 注意本地部署和远程部署时`web/index.html`中的base标签，https://github.com/flutter/flutter/issues/69760
    setPathUrlStrategy();

    /// sp初始化
    await SpUtil.getInstance();
    runApp(ProviderScope(child: MyApp(initPage)));

    ///屏幕刷新率和显示率不一致时的优化，必须挪动到 runApp 之后
    GestureBinding.instance.resamplingEnabled = true;
  });
}

class MyApp extends ConsumerWidget {
  Widget initPage;

  MyApp(this.initPage, {super.key}) {
    Log.init();
    initDioFormNative();
    Routes.initRoutes();
  }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void initDioFormNative() {
    // FlutterToNative().getNetHeaderBean().then((data) {
    //   initDio(data);
    // }, onError: (error) {
    //   Log.e(error);
    // });
    initDio(NetHeaderBean(
        authorization:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjdXJyZW50VGltZSI6MTcwNDkzODU5NTIyNSwicGxhdElkIjoiMSIsInBob25lIjoiMTcxOTg2MzMxNjkiLCJsZXZlbCI6IjMiLCJpc3MiOiJhdXRoMCIsInRlbmFudElkIjoiNjRGODQ5RjI1MzQzQUIzRTBBODhEQjhCIiwibUlkIjoiNjA5MWUzZWNlYzQ5NGUxOTlmNTg3OWRkNTRkMGQ5NDUiLCJ1c2VyVHlwZSI6IjEiLCJ1c2VyTmFtZSI6IjE3MTk4NjMzMTY5IiwiZXhwIjoxNzA0OTgxNzk1LCJzdXBlckFkbWluIjoiMCJ9.FZQILVmLwuhGcwm1S_owc2_0heIwl3NwmqsvRp_OKjs",
        userAgent: "ANDROID_2.0,11,OPPO_PDAM10",
        cityCode: "440305",
        acceptLanguage: "zh",
        baseUrl: "https://t-cloud-manage-api.ehuandian.net/"));
  }

  void initDio(NetHeaderBean data) {
    final List<Interceptor> interceptors = <Interceptor>[];

    /// 统一添加身份验证请求头
    interceptors.add(AuthInterceptor(data));

    /// 刷新Token
    interceptors.add(TokenInterceptor());

    /// 打印Log(生产模式去除)
    if (!Constant.inProduction) {
      interceptors.add(LoggingInterceptor());
    }

    /// 适配数据(根据自己的数据结构，可自行选择添加)
    interceptors.add(AdapterInterceptor());
    configDio(
      baseUrl: data.baseUrl,
      interceptors: interceptors,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OKToast(
        backgroundColor: Colors.black54,
        textPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom,
        child: _buildMaterialApp(ref));
  }

  Widget _buildMaterialApp(WidgetRef ref) {
    var themeNotifier = ref.watch(themeProvider);
    return MaterialApp(
      title: 'saas_flutter_module',
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染

      theme: themeNotifier.getTheme(),
      darkTheme: themeNotifier.getTheme(isDarkMode: true),
      themeMode: themeNotifier.getThemeMode(),
      home: initPage,
      onGenerateRoute: Routes.router.generator,
      navigatorKey: navigatorKey,
      builder: (BuildContext context, Widget? child) {
        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },

      /// 因为使用了fluro，这里设置主要针对Web
      onUnknownRoute: (_) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const NotFoundPage(),
        );
      },
      restorationScopeId: 'app',
    );
  }
}
