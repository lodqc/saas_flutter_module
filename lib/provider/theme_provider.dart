import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas_flutter_module/provider/web_page_transitions.dart';
import 'package:saas_flutter_module/res/colors.dart';
import 'package:saas_flutter_module/res/constant.dart';
import 'package:saas_flutter_module/res/styles.dart';
import 'package:sp_util/sp_util.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

class ThemeProvider extends ChangeNotifier {

  void syncTheme() {
    final String theme = SpUtil.getString(Constant.theme) ?? '';
    if (theme.isNotEmpty && theme != ThemeMode.system.value) {
      notifyListeners();
    }
  }

  void setTheme(ThemeMode themeMode) {
    SpUtil.putString(Constant.theme, themeMode.value);
    notifyListeners();
  }

  ThemeMode getThemeMode(){
    final String theme = SpUtil.getString(Constant.theme) ?? '';
    switch(theme) {
      case 'Dark':
        return ThemeMode.dark;
      case 'Light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
      primaryColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        secondary: isDarkMode ? Colours.dark_app_main : Colours.app_main,
        error: isDarkMode ? Colours.dark_red : Colours.color_FFFA5050,
      ),
      // Tab指示器颜色
      indicatorColor: isDarkMode ? Colours.dark_app_main : Colours.app_main,
      // 页面背景色
      scaffoldBackgroundColor: isDarkMode ? Colours.dark_bg_color : Colors.white,
      // 主要用于Material背景色
      canvasColor: isDarkMode ? Colours.dark_material_bg : Colors.white,
      // 文字选择色（输入框选择文字等）
      // textSelectionColor: Colours.app_main.withAlpha(70),
      // textSelectionHandleColor: Colours.app_main,
      // 稳定版：1.23 变更(https://flutter.dev/docs/release/breaking-changes/text-selection-theme)
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Colours.app_main.withAlpha(70),
        selectionHandleColor: Colours.app_main,
        cursorColor: Colours.app_main,
      ),
      textTheme: TextTheme(
        // TextField输入文字颜色
        titleMedium: isDarkMode ? TextStyles.textDark : TextStyles.text,
        // Text文字样式
        bodyMedium: isDarkMode ? TextStyles.textDark : TextStyles.text,
        titleSmall: isDarkMode ? TextStyles.textDarkGray12 : TextStyles.textGray12,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: isDarkMode ? TextStyles.textHint14 : TextStyles.textDarkGray14,
      ),
      dividerTheme: DividerThemeData(
        color: isDarkMode ? Colours.dark_line : Colours.line,
        space: 0.6,
        thickness: 0.6
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      pageTransitionsTheme: NoTransitionsOnWeb(),
      visualDensity: VisualDensity.standard,  // https://github.com/flutter/flutter/issues/77142,
      platform: TargetPlatform.android,
      // 如果需要去除对应的水波纹效果
      // splashFactory: NoSplash.splashFactory,
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
      // ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: isDarkMode ? Colours.dark_bg_color : Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarColor: isDarkMode ? Colours.dark_bg_color : Colors.white,
          statusBarColor: isDarkMode ? Colours.dark_bg_color : Colors.white,
          systemNavigationBarDividerColor: (isDarkMode ? Colours.dark_bg_color : Colors.white).withAlpha(199),
        ),
      ),
    );
  }

}
