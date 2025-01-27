import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_task/di.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bootcamp_task/presentation/core/themes/app_themes.dart';
import 'package:flutter_bootcamp_task/presentation/products/screen/products_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Bootcamp Task',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AppThemes.lightTheme,
        home: const ProductsScreen(),
      ),
    );
  }
}
