import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../shared/OPCVMOrdersWidget.dart';

class Orders extends StatefulWidget {
  const Orders({
    super.key,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class DataList {
  String valeur;
  int Qte, QteExecutee;
  double cours;
  String echeance;
  DataList(
      {required this.valeur,
      required this.Qte,
      required this.QteExecutee,
      required this.cours,
      required this.echeance});
}

class _OrdersState extends State<Orders> {
  List<DataList> items = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      items = List.of([
        DataList(
            valeur: 'ADH',
            Qte: 15,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
        DataList(
            valeur: 'IAM',
            Qte: 10,
            QteExecutee: 1,
            cours: 12.00,
            echeance: '20/10/202'),
        DataList(
            valeur: 'ALLiance',
            Qte: 15,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
        DataList(
            valeur: 'IAM',
            Qte: 10,
            QteExecutee: 1,
            cours: 12.00,
            echeance: '20/10/202'),
        DataList(
            valeur: 'ALLiance',
            Qte: 15,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
        DataList(
            valeur: 'IAM',
            Qte: 10,
            QteExecutee: 1,
            cours: 12.00,
            echeance: '20/10/202'),
        DataList(
            valeur: 'ALLiance',
            Qte: 15,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
        DataList(
            valeur: 'IAM',
            Qte: 10,
            QteExecutee: 1,
            cours: 12.00,
            echeance: '20/10/202'),
        DataList(
            valeur: 'ALLiance',
            Qte: 15,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
        DataList(
            valeur: 'IAM',
            Qte: 10,
            QteExecutee: 1,
            cours: 12.00,
            echeance: '20/10/202'),
        DataList(
            valeur: 'ALLiance',
            Qte: 3,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
        DataList(
            valeur: 'ABC',
            Qte: 15,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '03/01/2021'),
        DataList(
            valeur: 'ALLiance',
            Qte: 5,
            QteExecutee: 20,
            cours: 5.00,
            echeance: '11/10/2023'),
      ]);
    });
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ButtonsTabBar(
                radius: 15,
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                backgroundColor: Color(0xFF140C24),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/action.png'),
                    ),
                    text: "Action",
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/actions24.png'),
                    ),
                    text: "OPCVM",
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/virementsG24.png'),
                    ),
                    text: "Virement",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    //color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 2),
                            color: Colors.grey[300],
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(
                                'Mes Orders',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )),
                        Container(
                            width: double.infinity,
                            color: Colors.grey[350],
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Valeur',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    width: 60,
                                    child: Text(
                                      'Qté',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      'Qté Executée',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Cours',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = items[index];
                              return getSlidableList(item);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  OPCVMOrdersWidget(),
                  Container(
                    color: Colors.white,
                    child: Text('data 2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

getSlidableList(DataList item) {
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
        children: const [
          // A SlidableAction can have an icon and/or a label.

          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            icon: Icons.highlight_remove_sharp,
          ),
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: doNothing,
            backgroundColor: Color(0xFF140C24),
            foregroundColor: Colors.white,
            icon: Icons.create_outlined,
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: doNothing,
            backgroundColor: Color(0xFF140C24),
            foregroundColor: Colors.white,
            icon: Icons.create_outlined,
          ),
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            icon: Icons.highlight_remove_sharp,
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: Card(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        color: Colors.white,
        borderOnForeground: true,
        elevation: 10,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 80,
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(13, 0, 0, 5),
                      child: Text(
                        item.valeur,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 2),
                      child: Text(
                        item.echeance,
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 60,
                child: Align(
                  //alignment: Alignment.centerRight,
                  child: Text(
                    item.Qte.toStringAsFixed(0),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 100,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    item.QteExecutee.toStringAsFixed(0),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 80,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          item.cours.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.brightness_1_rounded,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}

void doNothing(BuildContext context) {}
