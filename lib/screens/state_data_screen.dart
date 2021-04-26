import 'package:flutter/material.dart';

class StateDataScreenArguments {
  final String stateName;
  final IconData stateIcon;

  StateDataScreenArguments(
    this.stateName,
    this.stateIcon,
  );
}

class StateDataScreen extends StatelessWidget {
  static String routeName = 'state_data_screen';
  @override
  Widget build(BuildContext context) {
    final StateDataScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as StateDataScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Icon(
                args.stateIcon,
                size: 20.0,
                color: Colors.red[900],
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(args.stateName)
            ]),
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            args.stateIcon,
            size: 100.0,
            color: Colors.red,
          ),
          Text(args.stateName),
        ]),
      ),
    );
  }
}
