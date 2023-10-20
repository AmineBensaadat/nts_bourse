import 'package:flutter/material.dart';

import '../screens/AjouterVirement.dart';
import '../services/ntsoft.dart';

class VirementWidget extends StatefulWidget {
  const VirementWidget({
    super.key,
  });

  @override
  State<VirementWidget> createState() => _VirementWidgetState();
}

class VirementList {
  String valeur;
  String date;
  String type;
  double montant;
  String statut;
  VirementList(
      {required this.valeur,
      required this.date,
      required this.type,
      required this.montant,
      required this.statut});
}

class _VirementWidgetState extends State<VirementWidget> {
  List<VirementList> items = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      items = List.of([
        VirementList(
          valeur: 'Virement_61',
          date: '20/10/2023',
          type: 'Externe',
          statut: 'En Cours',
          montant: 6000,
        ),
        VirementList(
          valeur: 'Virement_60',
          date: '20/10/2023',
          type: 'Externe',
          statut: 'Validée',
          montant: 7000,
        ),
        VirementList(
          valeur: 'Virement_70',
          date: '20/10/2023',
          type: 'Interne',
          statut: 'Validée',
          montant: 6000,
        ),
        VirementList(
          valeur: 'Virement_60',
          date: '20/10/2023',
          type: 'Externe',
          statut: 'Validée',
          montant: 7000,
        ),
        VirementList(
          valeur: 'Virement_70',
          date: '20/10/2023',
          type: 'Interne',
          statut: 'Validée',
          montant: 6000,
        ),
        VirementList(
          valeur: 'Virement_60',
          date: '20/10/2023',
          type: 'Externe',
          statut: 'Validée',
          montant: 7000,
        ),
        VirementList(
          valeur: 'Virement_70',
          date: '20/10/2023',
          type: 'Interne',
          statut: 'Validée',
          montant: 6000,
        ),
      ]);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 2),
            color: Colors.grey[300],
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mes Virements',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF140C24)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ajouterVirement(selectedTab: 0)),
                      );
                    },
                    icon: Icon(
                      // <-- Icon
                      Icons.add,
                    ),
                    label: Text('Ajouter'), // <-- Text
                  ),
                ],
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
                    width: 160,
                    child: Text(
                      'Valeur / Date virement',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    width: 90,
                    child: Text(
                      'Statut',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Montant / Type',
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
              return getListVirement(item);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
        Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                color: Colors.grey[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'Situation Du Compte N°',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
                        child: Text(
                          ntsDoubleToStr(3488113),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        'Solde',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      child: Text(
                        ntsDoubleToStr(10806905.08),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        'Achats en cours',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      child: Text(
                        ntsDoubleToStr(6392435),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        'Ventes non dénoués',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      child: Text(
                        ntsDoubleToStr(100.05),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        'Blocage Espèces',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      child: Text(
                        ntsDoubleToStr(10000000.05),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        'Solde Net pour virement',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                      child: Text(
                        ntsDoubleToStr(10008460.05),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Card getListVirement(item) {
    return Card(
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
              width: 140,
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
                  SizedBox(
                    height: 10,
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
              width: 120,
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
                        item.type,
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
    );
  }
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
