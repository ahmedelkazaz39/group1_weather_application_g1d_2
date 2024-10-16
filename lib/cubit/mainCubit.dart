import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group1_weather_application_g1d/cubit/mainstate.dart';

import '../constants/constants.dart';
import '../model/current_weather_data.dart';

class MainCubit extends Cubit<MainState> {
  Dio _dio = Dio();
  MainCubit() : super(const MainState.initial());
/*
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
*/
  static MainCubit get(context) => BlocProvider.of(context);

  CurrentWeatherData? currentWeatherData = CurrentWeatherData();

  Future<CurrentWeatherData> getWeatherData() async {
    emit(MainState.loading());

    _dio.get(ApiConstants.initialUrl).then((response) {
      emit(MainState.success(response.data));
      currentWeatherData = CurrentWeatherData.fromJson(response.data);
      return currentWeatherData;
    }).catchError((error) {
      emit(MainState.error(error: error.toString()));
      return null;
    });
    return currentWeatherData!;
  }
}
