import 'package:delivery_app/bindings/initial_bindings.dart';
import 'package:delivery_app/core/constant/app_theme.dart';
import 'package:delivery_app/core/constant/routes.dart';
import 'package:delivery_app/core/localization/change_local.dart';
import 'package:delivery_app/core/localization/translation.dart';
import 'package:delivery_app/core/services/services.dart';
import 'package:delivery_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController localeController =Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Delivery',
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialRoute: AppRoutes.splash,
      translations: AppTranslation(),
      locale: localeController.language,
      initialBinding: InitialBindings(),
      theme: appLightTheme,
    );
  }
}


