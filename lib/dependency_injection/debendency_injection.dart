import 'package:get_it/get_it.dart';
import 'package:group1_weather_application_g1d/cubit/mainCubit.dart';

import '../service/weather_service.dart';

final getIt = GetIt.instance;

Future<void> getInit() async {
  //Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<WeatherService>(() => WeatherService(
        city: 'cairo',
        lang: 'en',
      ));
  getIt.registerLazySingleton<MainCubit>(() => MainCubit());
}
