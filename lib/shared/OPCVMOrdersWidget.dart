import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../screens/subscriptionRachats.dart';
import '../services/ntsoft.dart';

class OPCVMOrdersWidget extends StatefulWidget {
  const OPCVMOrdersWidget({
    super.key,
  });

  @override
  State<OPCVMOrdersWidget> createState() => _OPCVMOrdersWidgetState();
}

class DataList {
  String valeur;
  String sens;
  double montant;
  String statut;
  int nbrPart;
  DataList(
      {required this.valeur,
      required this.sens,
      required this.montant,
      required this.statut,
      required this.nbrPart});
}

class _OPCVMOrdersWidgetState extends State<OPCVMOrdersWidget> {
  List<DataList> items = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      items = List.of([
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'En Cours',
          montant: 6000,
          nbrPart: 5,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'Validée',
          montant: 7000,
          nbrPart: 3,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'Validée',
          montant: 6000,
          nbrPart: 5,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'En Cours',
          montant: 6000,
          nbrPart: 5,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'Annulée',
          montant: 8000,
          nbrPart: 18,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'Annulée',
          montant: 3000,
          nbrPart: 2,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'En Cours',
          montant: 6000,
          nbrPart: 5,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'En Cours',
          montant: 6000,
          nbrPart: 5,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'En Cours',
          montant: 6000,
          nbrPart: 5,
        ),
        DataList(
          valeur: 'CAP IMT CROISSANCE',
          sens: 'Souscription',
          statut: 'En Cours',
          montant: 6000,
          nbrPart: 5,
        ),
      ]);
    });
    return Container(
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
                  'Mes OPCVM',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                      width: 140,
                      child: Text(
                        'Valeur',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Container(
                      width: 125,
                      child: Text(
                        'Sens / Statut',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Container(
                      width: 60,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Montant / Nbr de part',
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
                return getSlidableListOrderOPCVM(item);
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

getSlidableListOrderOPCVM(DataList item) {
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
            onPressed: (context) {},
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            icon: Icons.highlight_remove_sharp,
          ),
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionRachats()),
              );
            },
            backgroundColor: Color(0xFF140C24),
            foregroundColor: Colors.white,
            icon: Icons.create_outlined,
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionRachats()),
              );
            },
            backgroundColor: Color(0xFF140C24),
            foregroundColor: Colors.white,
            icon: Icons.create_outlined,
          ),
          SlidableAction(
            onPressed: (context) {},
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
        elevation: 3,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  item.valeur,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          item.sens,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.brightness_1_rounded,
                            color: getStatusColors(item.statut),
                            size: 15,
                          ),
                        ),
                        Container(
                          //width: 120,
                          child: Align(
                            //alignment: Alignment.centerRight,
                            child: Text(
                              item.statut,
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                width: 100,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          ntsDoubleToStr(item.montant),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(
                          item.nbrPart.toStringAsFixed(0),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
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

getStatusColors(String statut) {
  Color StatuColor = Colors.black;
  if (statut == 'En Cours') {
    StatuColor = Color.fromARGB(255, 255, 172, 78);
  }
  if (statut == 'Validée') {
    StatuColor = const Color.fromARGB(255, 145, 255, 149);
  }
  if (statut == 'Annulée') {
    StatuColor = const Color.fromARGB(255, 255, 137, 129);
  }
  return StatuColor;
}
