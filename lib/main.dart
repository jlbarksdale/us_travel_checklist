import 'package:flutter/material.dart';
import 'package:us_travel_checklist/screens/loading_screen.dart';
import 'package:us_travel_checklist/util/database.dart';
import 'package:provider/provider.dart';
import 'package:us_travel_checklist/data_object/us_states.dart';
import 'package:us_travel_checklist/screens/check_off_screen.dart';
import 'package:us_travel_checklist/screens/state_data_screen.dart';
import 'package:us_travel_checklist/util/styles.dart';

Future<void> main() async {
  //await Database().setup();
  runApp(FutureBuilder(
    future: Database().setup(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return ChangeNotifierProvider<States>(
          create: (context) => States(),
          child: MyApp(),
        );
      } else {
        return MaterialApp(
          home: Loading(),
        );
      }
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        StatesListView.routeName: (context) => StatesListView(),
        StateDataScreen.routeName: (context) => StateDataScreen(),
      },
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'Check off List',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: primaryColor),
        body: SafeArea(
          child: StatesListView(),
        ),
      ),
    );
  }
}
