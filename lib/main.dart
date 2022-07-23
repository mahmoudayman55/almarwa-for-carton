import 'package:alsafwa/view/corrugated_carton_view.dart';
import 'package:alsafwa/view/home_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'helper/Binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(

 [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      builder: () => GetMaterialApp(
       // builder: DevicePreview.appBuilder,

        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        home: HomeView(),
        theme: ThemeData(primarySwatch: Colors.blue),
      ),
    );
  }
}
