import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_travel_checklist/data_object/us_states.dart';
import 'package:us_travel_checklist/screens/state_data_screen.dart';
import 'package:us_travel_checklist/util/styles.dart';
import 'package:us_travel_checklist/util/us_states.dart';

class StatesListView extends StatelessWidget {
  static String routeName = 'states_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.light,
          title: Text(
            'Check off List',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: primaryColor),
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: primaryColor),
              itemCount: US_STATES.length,
              itemBuilder: (context, index) {
                return Consumer<States>(
                  builder: (BuildContext context, states, Widget? child) {
                    String stateName = states.getStateName(index);
                    IconData stateIconData = states.getStateIcon(index);
                    bool stateVisistedValue = states.getVisitedValue(index);
                    return ListTile(
                      title: Text(
                        stateName,
                        style: TextStyle(color: primaryColor),
                      ),
                      leading: Icon(
                        stateIconData,
                        size: 40.0,
                        color: accentColor,
                      ),
                      trailing: Checkbox(
                        activeColor: primaryColor,
                        checkColor: Colors.white,
                        value: stateVisistedValue,
                        onChanged: (value) {
                          Provider.of<States>(context, listen: false)
                              .setVisited(index);
                        },
                      ),
                      onTap: () {
                        print('Should Go to indivdual state screen');
                        //TODO: Design Screen for indivdual States
                        // Navigator.pushNamed(context, StateDataScreen.routeName,
                        //     arguments: StateDataScreenArguments(
                        //         states.getStateName(index), stateIconData));
                      },
                    ); //,
                    //);
                  },
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
