import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/routes.dart';
import 'package:untitled/view/my%20cart_screen/controller/cart_controller.dart';
import 'package:untitled/view/my%20cart_screen/my%20cart/mycart_screen.dart';
import 'Core/class/MyTranslations.dart';
import 'Core/service/my_service.dart';
import 'Core/service/routes.dart';
import 'binding/intial_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices().initialize;
  await intialService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      /*theme: ThemeData(

        primarySwatch: Colors.blue,
      ),*/
        initialBinding: InitialBindings(),  // Initialize bindings
        getPages: routes, // Ensure routes are properly configured in `routes.dart`
       initialRoute: Routes. HomeScreen,   // Define initial route
        translations: MyTranslation(),  // Ensure translation file is correctly configured
        locale: Locale('ar', 'SA'),  // Set default locale
        fallbackLocale: Locale('en', 'US'
        ),

    );
  }
}
//test
