// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task_management/provider/provider.dart';
import 'package:task_management/view/pages/course.dart';
import 'package:task_management/view/pages/splash.dart';
import 'package:task_management/view/pages/welcome.dart';
import 'data/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //AppRoute appRoute;
  MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<DbProvider>(
                create: (context) {
                  return DbProvider();
                },
              ),
            ],
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashView(),
              // onGenerateRoute: AppRoute.generateRoute,
              // initialRoute: AppRoute.splashPage,
            ),
          );
        });
  }
}
