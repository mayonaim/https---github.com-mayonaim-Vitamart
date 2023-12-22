import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vitamart/themes/Theme.dart';
import 'package:vitamart/routes/routes.dart';
import 'package:vitamart/AppBinding.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vitamart',
      theme: Themes.vTheme,
      getPages: Routes.routes,
      initialRoute: Routes.initial,
      initialBinding: AppBinding(),
    );
  }
}
