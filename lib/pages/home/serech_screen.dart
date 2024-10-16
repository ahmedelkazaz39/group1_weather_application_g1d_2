import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../controller/HomeController.dart';
import '../../widget/MyCard.dart';
import '../../widget/appbarwidget.dart';
import '../../widget/myList.dart';
import '../../widget/my_chart.dart';
import 'main_screen.dart';

class SerechScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:  AppBarClass().getAppBar(context),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter:
                      ColorFilter.mode(Colors.black38, BlendMode.darken),
                      image: AssetImage(
                        'assets/images/cloud-in-blue-sky.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: TextField(
                            onChanged: (value) => controller.city = value,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textInputAction: TextInputAction.search,
                            onSubmitted:  (value) => controller.initStateSearch(value.toString()),

                            decoration: InputDecoration(
                              suffix: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              hintStyle: TextStyle(color: Colors.white),
                              hintText: 'Search'.toUpperCase(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),

                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.25,



                            child: MyCard()),

                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child:
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'Other city'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                      fontSize: 16,
                                      fontFamily: 'flutterfonts',
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),


                                MyList(),



                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Forecast next 5 days'.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      Icon(
                                        Icons.next_plan_outlined,
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ),



                                MyChart(),



                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}


void _showMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {

                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Search'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SerechScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Contact Us'),
                onTap: () {

                },
              ),
            ],
          ),
        ),
      );
    },
  );
}