import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Orders extends StatefulWidget {
  const Orders({
    super.key,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class DataList {
  String name, title, date;
  DataList({required this.name, required this.title, required this.date});
}

class _OrdersState extends State<Orders> {
  List<DataList> items = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      items = List.of([
        DataList(
            name: 'Amine Bnesaadat',
            title: "Audiance - Tribunal Casa B",
            date: '05/04/2023'),
        DataList(
            name: 'Ahmed Abc',
            title: "Rendez-vous - Tribunal Casa R",
            date: '08/09/2023'),
        DataList(
            name: 'Rachid rachdi',
            title: "Depalacement - Tribunal Casa Meknas",
            date: '08/09/2023'),
        DataList(
            name: 'meryem afnan',
            title: "P1 - Tribunal Fes",
            date: '08/09/2023'),
        DataList(
            name: 'Amine Bnesaadat',
            title: "Audiance - Tribunal Casa B",
            date: '05/04/2023'),
        DataList(
            name: 'Ahmed Abc',
            title: "Rendez-vous - Tribunal Casa R",
            date: '08/09/2023'),
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
              width: double.infinity,
              child: Center(
                child: ButtonsTabBar(
                  radius: 15,
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  backgroundColor: Color(0xFF140C24),
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/action.png'),
                      ),
                      text: "Action",
                    ),
                    Tab(
                      icon: ImageIcon(
                        AssetImage(
                            'assets/images/icons/icons8-chandeliers-96.png'),
                      ),
                      text: "Marché",
                    ),
                    Tab(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/actions24.png'),
                      ),
                      text: "OPCVM",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Valeur',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Qté',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Qté Executée',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Cours',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Echeance',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            )),
                        SlidableWidget()
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text('data 1'),
                  ),
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

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: const [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.share,
            label: 'Share',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: doNothing,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: Container(
        child: Row(
          children: [
            Text('vcvcfv'),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
