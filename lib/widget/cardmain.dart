import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:group1_weather_application_g1d/cubit/mainstate.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';
import '../cubit/mainCubit.dart';

class MyCardmain extends GetView<MainCubit> {
  @override
  Widget build(BuildContext context) {

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

Widget  getMainControl(BuildContext context) {

  return BlocListener<MainCubit, MainState>(
    listenWhen: (previous, current) =>
    current is Loading || current is Error || current is Success,
    listener: (context, state) {
      state.whenOrNull(
        loading: () {
          showDialog(
              context: context,
              builder: (context) =>
              const Center(child: CircularProgressIndicator()));
        },
        error: (error) {
          //context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong'),
            ),
          );
        },
        success: (loginResponse) {
          SingleChildScrollView(
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
                          '${context.read<MainCubit>().currentWeatherData!.name!.toUpperCase()}',
                          //controller.currentWeatherData.name}'.toUpperCase(),
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
                          '${context.read<MainCubit>().currentWeatherData!.weather![0].description!.toString().toUpperCase()}',
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
                            '${(context.read<MainCubit>().currentWeatherData!.main!.temp!- 273.15).round().toString()}\u2103',
                            //'${(MainCubit.get(context).payload?['temp'] - 273.15).round().toString()}'.toString(),
                            // (controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                fontSize: 45,
                                color: Colors.black45,
                                fontFamily: 'flutterfonts'),
                          ),
                          Text(
                            'min: ${context.read<MainCubit>().currentWeatherData!.main!.tempMin!}\u2103 / max: ${context.read<MainCubit>().currentWeatherData!.main!.tempMax!}\u2103',
                            // (controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
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
                                'wind ${context.read<MainCubit>().currentWeatherData!.wind!.speed!}m/s',
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
        },
      );
    },
    child: const SizedBox.shrink(),
  );
}
}


