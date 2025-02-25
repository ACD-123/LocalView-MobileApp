import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:localview/bindings/appbindings.dart';
import 'package:localview/helpers/routeconstants.dart';
import 'package:localview/helpers/routemanagment.dart';
import 'services/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Local View",
          initialBinding: AppBindings(),
          defaultTransition: Transition.cupertino,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          getPages: RouteManagment.getPages(),
          initialRoute: RouteConstants.splashscreen,
        );
      },
    );
  }
}
