import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:us_travel_checklist/screens/loading_screen.dart';
import 'package:us_travel_checklist/util/database.dart';
import 'package:provider/provider.dart';
import 'package:us_travel_checklist/data_object/us_states.dart';
import 'package:us_travel_checklist/screens/check_off_screen.dart';
import 'package:us_travel_checklist/screens/state_data_screen.dart';
import 'package:us_travel_checklist/util/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // This Future is the local database setup
        future: Database().setup(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //Once database is loaded run app
          if (snapshot.connectionState == ConnectionState.done) {
            return ChangeNotifierProvider<States>(
              create: (context) => States(),
              child: MaterialApp(
                title: 'US Check Off',
                theme: ThemeData.dark().copyWith(
                  primaryColor: primaryColor,
                  scaffoldBackgroundColor: Colors.white,
                ),
                routes: {
                  StatesListView.routeName: (context) => StatesListView(),
                  StateDataScreen.routeName: (context) => StateDataScreen(),
                },
                home: StatesListView(),
              ),
            );
          }
          // show loading screen until all data is loaded
          else {
            return MaterialApp(
              home: Loading(),
            );
          }
        });
  }
}
