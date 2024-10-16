import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:group1_weather_application_g1d/pages/listAppbar/theme_provider.dart';
import 'package:group1_weather_application_g1d/pages/onboarding/onboarding_screen.dart';
import 'package:group1_weather_application_g1d/utils/Binding/HomeBinding.dart';
import 'package:provider/provider.dart';

import 'cubit/mainCubit.dart';
import 'dependency_injection/debendency_injection.dart';

void main() async{
  await getInit();
  runApp(
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
          child: WeatherApp()
      ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BlocProvider(
        create: (context) => getIt.get<MainCubit>(),
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => OnboardingScreen(),
          binding: HomeBinding(),
        )
      ],
    ),
    );
  }
}
