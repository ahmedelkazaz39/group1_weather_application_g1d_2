import 'package:flutter/material.dart';
import 'package:group1_weather_application_g1d/pages/listAppbar/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'location.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loaded = false;
  bool _notifications =false;

  bool _location = false;
  int langIndex = 0;
  String lang = 'en';
  String city = 'Cairo';
  double lat = 30.0626;
  double long = 31.2497;
  bool isDark = false;
  //bool notification = false;
  @override
  Widget build(BuildContext context) {
    _getLocation().then((Value) {
      if (Value != _location) {
        setState(() {
          _location = Value;
        });
      }

    });
    _getNotifications().then((Value){
      if(Value!=_notifications)
        setState(() {
        _notifications=Value;
      });
    });
_getPrefLang().then((Value){
  if(Value!=langIndex) {
    setState(() {
      langIndex = Value;
    });
  }
});
    final themeProvider = Provider.of<ThemeProvider>(context);
    //_getValues();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          // Theme Switch
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: themeProvider.isDarkMode,
            onChanged: (value) async {
              isDark = value == themeProvider.isDarkMode;
              final SharedPreferences prefs =
              await SharedPreferences.getInstance();
              // TODO: set App isDark
              prefs.setBool('_weather_DarkMode', isDark);
              themeProvider.toggleTheme(value);

            },
            secondary: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
          ),

          const Divider(),

          // Notifications Switch
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notifications,
            onChanged: (bool value) async {
              final SharedPreferences prefs =
              await SharedPreferences.getInstance();
              prefs.setBool('_weather_notifications', value);
              setState(() {
                _notifications = value;

              });
            },
            secondary: const Icon(Icons.notifications),
          ),
          const Divider(),
          // Location Switch
          SwitchListTile(
            title: const Text('Enable Location Services'),
            value: _location,
            onChanged: (bool value) async {
              final SharedPreferences prefs =
              await SharedPreferences.getInstance();
              prefs.setBool('_weather_location', _location);
              setState(() {
                _location = value;

              });
            },
            secondary: const Icon(Icons.location_on),
          ),
          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationSetting()));
                  },
                  child: Text('Active Location'),
                ),
              ),
            ],
          ),

          const Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            RadioMenuButton(
              value: 0,
              groupValue: langIndex,
              onChanged: (Value) async{
                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                prefs.setString('_weather_Lang', lang);
                setState (()  {
                    langIndex = Value!;
                    _setLang(Value);

                  },
                );
              },
              child: Text(
                "English",
              ),
            ),
            RadioMenuButton(
              value: 1,
              groupValue: langIndex,
              onChanged: (value) async{
                final SharedPreferences prefs =
                await SharedPreferences.getInstance();
                prefs.setString('_weather_Lang', lang);
                setState(()  {
                  langIndex = value!;
                  _setLang(value);

                });
              },
              child: Text(
                "العربية",
              ),
            ),
          ]),

        ],
      ),
    );
  }

  void _setLang(int value) {
    switch (value) {
      case 0:
        lang = 'en';
        break;
      case 1:
        lang = 'ar';
        break;
      default:
        lang = 'en';
    }
  }

  static Future<bool> _getLocation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('_weather_location') ?? false;
  }

  static Future<bool> _getNotifications() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('_weather_notifications') ?? false;
  }

  static Future<int> _getPrefLang() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return (prefs.getString('_weather_Lang')??'en') == 'ar' ? 1 : 0;
  }
}
