
import '../api/api_repository.dart';
import '../constants/constants.dart';
import '../model/current_weather_data.dart';
import '../model/five_days_data.dart';

class WeatherServiceHome {
  final double lat;
  final double lon;
  final String lang;

  String baseUrl = ApiConstants.apiBaseUrl;
  String apikey=ApiConstants.apiKey;


  WeatherServiceHome({ required this.lat, required this.lon, required this.lang});

  void getCurrentWeatherData({
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?lon=$lon&&lon=$lat&lang=$lang&$apikey';
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {
          if (beforSend != null)
            {
              beforSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess!(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }



  void getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?lon=$lon&&lon=$lat&lang=$lang&$apikey';
    print(url);
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess!((data['list'] as List)
              .map((t) => FiveDayData.fromJson(t))
              .toList())
        },
        onError: (error) => {
          print(error),
          onError!(error),
        });
  }



}
