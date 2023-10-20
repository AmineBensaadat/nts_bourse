import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../shared/NavDrawer.dart';
import '../shared/appbar.dart';

class SubscriptionRachats extends StatefulWidget {
  @override
  State<SubscriptionRachats> createState() => _SubscriptionRachatsState();
}

class _SubscriptionRachatsState extends State<SubscriptionRachats> {
  final _formKeySubscriptionRachats = GlobalKey<FormState>();
  Color BorderTextFiledColor = Colors.grey;
  List<String> listTypeCours = ['RACHAT', 'SOUSCRIPTION'];
  String? sens = 'RACHAT'; //no radio button will be selected
  String selectval = 'RACHAT';
  bool montantReadOnly = true;
  bool nbrPartReadOnly = false;
  bool buttonenabled = false;
  Color buttonValidateColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    final ProgressDialog pr = ProgressDialog(
      context,
      type: ProgressDialogType.normal,
      isDismissible: true,
      showLogs: true,
    );
    pr.style(
        message: 'Chargement ...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 50.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w400));
    return Scaffold(
      appBar: AppbarWidget(),
      endDrawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Container(
                          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Souscriptions Rachats',
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
              Form(
                  key: _formKeySubscriptionRachats,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                    child: Text(
                                      'OPCVM',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: Text(
                                      'Sens',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Flexible(
                              flex: 3,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xFFADB6CA))),
                                    child: TextFormField(
                                      initialValue: "CAP IMT",
                                      readOnly: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        errorStyle:
                                            const TextStyle(height: 2.0),
                                        errorMaxLines: 1,
                                        errorText: '',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: -2, horizontal: 15),
                                        border: InputBorder.none,
                                      ),
                                      //controller: CoursAcheterController
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xFFADB6CA))),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 0, 5),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        isDense: true,
                                        value: selectval,
                                        onChanged: (value) async {
                                          pr.show();
                                          setState(() {
                                            selectval = value.toString();
                                            sens = value;
                                            if (value == 'SOUSCRIPTION') {
                                              montantReadOnly = false;
                                            } else {
                                              montantReadOnly = true;
                                            }

                                            if (value == 'RACHAT') {
                                              nbrPartReadOnly = false;
                                            } else {
                                              nbrPartReadOnly = true;
                                            }
                                            Future.delayed(Duration(seconds: 1))
                                                .then((value) {
                                              pr.hide().whenComplete(() {
                                                print(pr.isShowing());
                                              });
                                            });
                                          });
                                        },
                                        items: listTypeCours.map((itemone) {
                                          return DropdownMenuItem(
                                              value: itemone,
                                              child:
                                                  Center(child: Text(itemone)));
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          'Type Souscription',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                          width: 35,
                                          child: Radio(
                                            value: 'RACHAT',
                                            groupValue: sens,
                                            onChanged: (value) {
                                              pr.show();
                                              setState(() {
                                                sens = value.toString();
                                                nbrPartReadOnly = false;
                                                montantReadOnly = true;

                                                Future.delayed(
                                                        Duration(seconds: 1))
                                                    .then((value) {
                                                  pr.hide().whenComplete(() {
                                                    print(pr.isShowing());
                                                  });
                                                });
                                              });
                                            },
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                          )),
                                      Text('Nbr de part',
                                          style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xFFADB6CA))),
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    initialValue: '0.00',
                                    readOnly: nbrPartReadOnly,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(height: 2.0),
                                      errorMaxLines: 1,
                                      errorText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: -2, horizontal: 15),
                                      border: InputBorder.none,
                                    ),
                                    //controller: CoursAcheterController
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                          width: 35,
                                          child: Radio(
                                            value: 'SOUSCRIPTION',
                                            groupValue: sens,
                                            onChanged: (value) {
                                              pr.show();
                                              setState(() {
                                                sens = value.toString();
                                                nbrPartReadOnly = true;
                                                montantReadOnly = false;
                                                Future.delayed(
                                                        Duration(seconds: 1))
                                                    .then((value) {
                                                  pr.hide().whenComplete(() {
                                                    print(pr.isShowing());
                                                  });
                                                });
                                              });
                                            },
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                          )),
                                      Text('Montant',
                                          style: TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xFFADB6CA))),
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    initialValue: '0.00',
                                    readOnly: montantReadOnly,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(height: 2.0),
                                      errorMaxLines: 1,
                                      errorText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: -2, horizontal: 15),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                                  child: Text(
                                    'Derniére VL',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xFFADB6CA))),
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    initialValue: '450.00',
                                    readOnly: true,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(height: 2.0),
                                      errorMaxLines: 1,
                                      errorText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: -2, horizontal: 15),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                                  child: Text(
                                    'Droit d\'entrée',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xFFADB6CA))),
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    initialValue: '1.00',
                                    readOnly: true,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(height: 2.0),
                                      errorMaxLines: 1,
                                      errorText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: -2, horizontal: 15),
                                      border: InputBorder.none,
                                    ),
                                    //controller: CoursAcheterController
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Text(
                                    'Montant théorique de la transction',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xFFADB6CA))),
                                  child: TextFormField(
                                    textAlign: TextAlign.right,
                                    initialValue: '0.00',
                                    readOnly: true,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      errorStyle: const TextStyle(height: 2.0),
                                      errorMaxLines: 1,
                                      errorText: '',
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: -2, horizontal: 15),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  flex: 0,
                                  child: Container(
                                    child: Checkbox(
                                      value: buttonenabled,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          buttonenabled = value ?? false;
                                          if (buttonenabled) {
                                            buttonValidateColor = Colors.white;
                                          } else {
                                            buttonValidateColor = Colors.grey;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    child: Text(
                                      'Je déclare souscrire la valeur suivante, dans l\'OPCVM désigné dessus par le débit de mon susmentionneé',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 5, 0),
                              child: Text(
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500),
                                  '* Valeurs provisoires sous réserve d\'application de la VL définitive et de prélèvement des droits d\'entrée commerciaux appliquer à l\'OPCVM.'),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF140C24)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 0)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27))),
                                  ),
                                  onPressed: buttonenabled ? () {} : null,
                                  child: Text(
                                    'Valider',
                                    style:
                                        TextStyle(color: buttonValidateColor),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 233, 179, 16)),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 50, vertical: 0)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(27))),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Annuler'),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
