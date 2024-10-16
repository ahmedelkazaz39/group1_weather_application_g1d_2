import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/HomeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.lazyPut(() => HomeController(city: prefs.getString('_weather_City') ?? 'Cairo'
        , lang: prefs.getString('_weather_lang') ?? 'en'));
  }
}
