import 'package:group1_weather_application_g1d/constants/constants.dart';

import '/api/api_repository.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';

 class WeatherService {
   final String city;
   final String lang;

  String baseUrl = ApiConstants.apiBaseUrl;
  String apikey=ApiConstants.apiKey;


  WeatherService({ required this.city, required this.lang});



   void getCurrentWeatherData({
     Function()? beforSend,
     Function(CurrentWeatherData currentWeatherData)? onSuccess,
     Function(dynamic error)? onError,
   }) {
     final url = '$baseUrl/weather?q=$city&lang=$lang&$apikey';
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
     final url = '$baseUrl/forecast?q=$city&lang=$lang&$apikey';
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


  void getCurrentWeatherDataSearch(  {
    Function()? beforSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
    required String citySearch,
  }) {
    final url = '$baseUrl/weather?q=$citySearch&lang=$lang&$apikey';
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



  void getFiveDaysThreeHoursForcastDataSearch({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
    required String citySearch,
  }) {
    final url = '$baseUrl/forecast?q=$citySearch&lang=$lang&$apikey';
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
