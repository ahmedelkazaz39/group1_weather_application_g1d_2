import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/weather_serves_home.dart';
import '../service/weather_service.dart';
import '/model/current_weather_data.dart';
import '/model/five_days_data.dart';

class HomeController extends GetxController {
  String city;
  String lang;
  String? searchText;
  double? lat;
  double? lon;

  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];

  HomeController({required this.city, required this.lang});

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }

  void updateWeather() {
    initState();
  }

  void initState() {
    getCurrentWeatherData();
    getFiveDaysData();
  }


  void getCurrentWeatherData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? alVal = prefs.getDouble('_weather_lat') ?? lat;
    double? loVal = prefs.getDouble('_weather_lon') ?? lon;
    WeatherServiceHome(
        lat: alVal!.toDouble(),
        lon: loVal!.toDouble(),
        lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) =>
        {
          print(error),
          update(),
        });
  }


  void getTopFiveCities() {
    List<String> cities = [
      'Cairo',
      'Alexandria',
      'Giza',
      'Qalyubia',
      'Sharqia',
      'Dakahlia',
      'Beheira',
      'Kafr El Sheikh',
      'Gharbia',
      'Monufia',
      'Damietta',
      'Port Said',
      'Ismailia',
      'Suez',
      'North Sinai',
      'South Sinai',
      'Faiyum',
      'Beni Suef',
      'Minya',
      'Assiut',
      'Sohag',
      'Qena',
      'Luxor',
      'Aswan',
      'Red Sea',
      'Matrouh',
    ];
    cities.forEach((c) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      WeatherService(
          city: '${c}', lang: '${prefs.getString('_weather_lang') ?? lang}')
          .getCurrentWeatherData(onSuccess: (data) {
        dataList.add(data);
        update();
      }, onError: (error) {
        print(error);
        update();
      });
    });
  }

  void getFiveDaysData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? alVal = prefs.getDouble('_weather_lat') ?? lat;
    double? loVal = prefs.getDouble('_weather_lon') ?? lon;
    WeatherServiceHome(
        lat: alVal!.toDouble(),
        lon: loVal!.toDouble(),
        lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }


  void searchFiveDaysData(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WeatherService(
        city: '${city}', lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }


  void initStateSearch(String city) {
    searchWeatherData(city);
    getFiveDaysDataSearch(city);
  }

  void searchWeatherData(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WeatherService(
        city: '${city}', lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getCurrentWeatherDataSearch(citySearch: city,
        onSuccess: (data) {
          currentWeatherData = data;
          update();
        },
        onError: (error) =>
        {
          print(error),
          update(),
        });
  }


  void getFiveDaysDataSearch(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    WeatherService(
        city: '${city}', lang: '${prefs.getString('_weather_lang') ?? lang}')
        .getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
          update();
        }, onError: (error) {
      print(error);
      update();
    });
  }


}
