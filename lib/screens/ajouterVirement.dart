import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../shared/NavDrawer.dart';
import '../shared/appbar.dart';

List<String> listComptes = [
  '323232352121212',
  '166561227231564',
  '966561223123154'
];
String selectval = "323232352121212";

class ajouterVirement extends StatefulWidget {
  final int selectedTab;
  const ajouterVirement({required this.selectedTab});
  @override
  State<ajouterVirement> createState() => _ajouterVirementState();
}

class _ajouterVirementState extends State<ajouterVirement> {
  final _formKeyExterne = GlobalKey<FormState>();
  final _formKeyCompteACompte = GlobalKey<FormState>();
  final _formDemandeChequekey = GlobalKey<FormState>();
  Color BorderTextFiledColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    String ComptesValues = listComptes.first;
    return Scaffold(
      appBar: AppbarWidget(),
      endDrawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 45,
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.keyboard_backspace_rounded,
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Color(0xFF140C24),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Text(
                                'Nouveau Virement ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: Container(
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
                          labelStyle: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          tabs: [
                            Tab(
                              text: "Externe",
                            ),
                            Tab(
                              text: "Compte à compte",
                            ),
                            Tab(
                              text: "Demande chéque",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            Container(
                              //color: Colors.white,
                              child: _formajouterExterneVirement(),
                            ),
                            Container(
                              //color: Colors.white,
                              child: _formCompteAcompteVirement(ComptesValues),
                            ),
                            Container(
                              //color: Colors.white,
                              child: _formDemandeCheque(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _formajouterExterneVirement() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKeyExterne,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Montant',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Montant';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'RIB',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le RIB';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Destinataire',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Destinataire';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 60,
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Libelle',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Libelle';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF140C24)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => {_onSubmitExterne()},
                      child: Text('Valider'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => [Navigator.pop(context)],
                      child: Text('Annuler'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  _formCompteAcompteVirement(ComptesValues) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKeyCompteACompte,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Montant',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Montant';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Compte',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: getComptes(ComptesValues)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF140C24)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => {_onSubmitCompteACompte()},
                      child: Text('Valider'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => [Navigator.pop(context)],
                      child: Text('Annuler'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  _formDemandeCheque() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formDemandeChequekey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Montant',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Montant';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Destinataire',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: BorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer le Destinataire';
                          }

                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(height: 2.0),
                          errorMaxLines: 1,
                          errorText: '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF140C24)),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => {_onSubmitDemandeCheque()},
                      child: Text('Valider'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => [Navigator.pop(context)],
                      child: Text('Annuler'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  _onSubmitExterne() async {
    if (_formKeyExterne.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  _onSubmitCompteACompte() async {
    if (_formKeyCompteACompte.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  _onSubmitDemandeCheque() async {
    if (_formDemandeChequekey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  getComptes(ComptesValues) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFADB6CA))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
        child: DropdownButton(
          isExpanded: true,
          underline: SizedBox(),
          isDense: true,
          value: selectval,
          onChanged: (value) {
            setState(() {
              selectval = value.toString();
              if (selectval != 'Limit') {
                BorderTextFiledColor = Colors.grey;
              }
            });
          },
          items: listComptes.map((itemone) {
            return DropdownMenuItem(
                value: itemone, child: Center(child: Text(itemone)));
          }).toList(),
        ),
      ),
    );
  }
}
