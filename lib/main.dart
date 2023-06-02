import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:owner_ordering_frontend/utils/constants.dart';
import 'package:owner_ordering_frontend/view/categories/categories_screen.dart';
import 'package:owner_ordering_frontend/view/customerLogin/components/login&signUp.dart';
import 'package:owner_ordering_frontend/view/orders/components/orders.dart';

import 'firebase_options.dart';
import 'model/repository/socket_service.dart';
import 'view/subscriptions/components/restaurantList.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SocketService.connectAndListen();
    return ScreenUtilInit(
      designSize: const Size(1920.0, 1080.0),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          getPages: [
            GetPage(name: OrderPage, page: () => Orders()),
            GetPage(name: Loginsignup, page: () => PhoneNumberScreen()),
            GetPage(name: RestaurantListPage, page: () => RestaurantListScreen()),
            GetPage(name: CategoriesPage, page: () => CategoriesScreen(),
            ),
          ],
          // title: 'FastFeed',
          initialRoute: Loginsignup,
          textDirection: TextDirection.rtl,
          defaultTransition: Transition.noTransition,
          theme: ThemeData(
            primarySwatch: YellowColor.toMaterialColor(),
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
        );
      },
    );
  }
}