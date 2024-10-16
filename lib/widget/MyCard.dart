import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';
import '../controller/HomeController.dart';

class MyCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.initState();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: double.infinity,
      child:  Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: getMainControl(context),
      ),
    );
  }

Widget  getMainControl(BuildContext context,) {
    if( controller.currentWeatherData.weather == null)
    {
      return SizedBox(
        height: 150,
        width: 150,
        child: CircularProgressIndicator(),
      );
    }
    else{
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //TODO
            Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      '${controller.currentWeatherData.name}'.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black45,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black45,
                        fontSize: 16,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '${controller.currentWeatherData.weather![0].description}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black45,
                        fontSize: 18,
                        fontFamily: 'flutterfonts',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                            fontSize: 45,
                            color: Colors.black45,
                            fontFamily: 'flutterfonts'),
                      ),
                      Text(
                        'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                        style:
                        Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'flutterfonts',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: LottieBuilder.asset(Images.cloudyAnim),
                        ),
                        Container(
                          child: Text(
                            'wind ${controller.currentWeatherData.wind!.speed} m/s',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'flutterfonts',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
}
}

