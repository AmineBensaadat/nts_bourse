import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nts_bourse_app/screens/subscription.dart';
import 'package:nts_bourse_app/screens/subscriptionRachats.dart';

import '../custom_icons.dart';
import '../services/ntsoft.dart';

// ignore: import_of_legacy_library_into_null_safe

class OpcvmWidget extends StatefulWidget {
  const OpcvmWidget({
    super.key,
  });

  @override
  State<OpcvmWidget> createState() => _OpcvmWidgetState();
}

class DataList {
  String name;
  String type;
  double vl;
  double variation;
  DataList(
      {required this.name,
      required this.type,
      required this.vl,
      required this.variation});
}

class _OpcvmWidgetState extends State<OpcvmWidget> {
  List<DataList> items = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      items = List.of([
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: 0,
          vl: 450,
        ),
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: 14,
          vl: 450,
        ),
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: -3,
          vl: 450,
        ),
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: 0,
          vl: 450,
        ),
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: 0,
          vl: 450,
        ),
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: 0,
          vl: 450,
        ),
        DataList(
          name: 'CAP IMT ',
          type: 'OPCVM Monétaire',
          variation: 10,
          vl: 450,
        ),
      ]);
    });
    return Container(
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      'Nom / Type',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'VL',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Variation',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return getSlidableListOPCVM(item);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

void goToScreen(BuildContext context, screenName) {
  if (screenName == 'Subscription') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Subscription()),
    );
  }

  if (screenName == 'Rachats') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubscriptionRachats()),
    );
  }
}

getSlidableListOPCVM(DataList item) {
  return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        //dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              goToScreen(context, 'Subscription');
            },
            backgroundColor: Color(0xFF140C24),
            foregroundColor: Colors.white,
            icon: CustomIcons.sous24,
          ),
          SlidableAction(
            onPressed: (context) {
              goToScreen(context, 'Rachats');
            },
            backgroundColor: Colors.amber,
            foregroundColor: Color(0xFF140C24),
            icon: CustomIcons.rachat24,
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              goToScreen(context, 'Subscription');
            },
            backgroundColor: Color(0xFF140C24),
            foregroundColor: Colors.white,
            icon: CustomIcons.sous24,
          ),
          SlidableAction(
            onPressed: (context) {
              goToScreen(context, 'Rachats');
            },
            backgroundColor: Colors.amber,
            foregroundColor: Color(0xFF140C24),
            icon: CustomIcons.rachat24,
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: Card(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        color: Colors.white,
        borderOnForeground: true,
        elevation: 3,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //width: 150,
                        margin: EdgeInsets.fromLTRB(5, 18, 0, 0),
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Text(
                          item.type,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  //width: 120,
                  child: Text(
                    ntsDoubleToStr(item.vl),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(flex: 1, child: getVariation(item.variation))
            ],
          ),
        ),
      ));
}

void doNothing(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SubscriptionRachats()),
  );
}

Widget getVariation(variation) {
  if (variation > 0) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green[400],
        ),
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        height: double.infinity,
        width: 70, //
        child: Center(
            child: Text(variation.toStringAsFixed(2) + ' %',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))));
  } else if (variation < 0) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red[400],
        ),
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        height: double.infinity,
        width: 70, //
        child: Center(
            child: Text(variation.toStringAsFixed(2) + ' %',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))));
  } else {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
        height: double.infinity,
        width: 70, //
        child: Center(
            child: Text(variation.toStringAsFixed(2) + ' %',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12))));
  }
}
