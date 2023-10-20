import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../services/ntsoft.dart';
import '../shared/NavDrawer.dart';
import '../shared/appbar.dart';

class orderData {
  double seuilBas, seuilHaut;
  orderData({required this.seuilBas, required this.seuilHaut});
}

double seuilBas = 500, seuilHaut = 550;
DateTime selectedDate = DateTime.now();

class SetOrder extends StatefulWidget {
  final String name;
  final int selectedTab;
  const SetOrder({required this.name, required this.selectedTab});
  @override
  State<SetOrder> createState() => _SetOrderState();
}

class _SetOrderState extends State<SetOrder>
    with SingleTickerProviderStateMixin {
  List<String> listTypeCoursAchat = ['Limit', 'Market', 'Market To Limit'];
  List<String> listTypeCoursVente = ['Limit', 'Market', 'Market To Limit'];
  String selectvalAchat = "Limit";
  String selectvalVente = "Limit";
  late final TabController _tabController;
  final _formKeyAcheter = GlobalKey<FormState>();
  final _formKeyVente = GlobalKey<FormState>();
  Color BorderTextFiledColor = Colors.grey;
  Color CoursBorderTextFiledColor = Colors.grey;
  Color CoursBorderTextFiledColorVente = Colors.grey;
  int tabIndex = 0;
  final CoursAcheterController = TextEditingController();
  final CoursVenteController = TextEditingController();
  final TypeValiditeVenteController = TextEditingController();
  final qteVenteController = TextEditingController();
  final qteController = TextEditingController();
  final qteControllerVente = TextEditingController();
  final TypeValiditeController = TextEditingController();
  final validiteAchatController = TextEditingController();
  final validiteVenteController = TextEditingController();
  List<String> listTypeValiditeAchat = ['Day', 'GTD Good Till Date'];
  List<String> listTypeValiditeVente = ['Day', 'GTD Good Till Date'];
  String selectvalTypeValiditeAchat = "Day";
  String selectvalTypeValiditeVente = "Day";
  bool typeCourAchat = false;
  bool typeCourVente = false;

  bool typeValiditeAchat = true;
  bool typeValiditeVente = true;
  FocusNode node = FocusNode();
  AutovalidateMode autovalidateFormAchat = AutovalidateMode.disabled;

  @override
  void initState() {
    _tabController =
        TabController(initialIndex: widget.selectedTab, length: 2, vsync: this);
    super.initState();

    tabIndex = widget.selectedTab;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  setColor(int tabIndex) {
    print(tabIndex);
    if (tabIndex == 0) {
      return Colors.green;
    } else if (tabIndex == 1) {
      return Colors.red;
    } else if (tabIndex == 2) {
      return Colors.yellow;
    }
  }

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

    String TypeCoursAchatDropdownValue = listTypeCoursAchat.first;
    String TypeCoursVenteDropdownValue = listTypeCoursVente.first;
    return Scaffold(
      appBar: AppbarWidget(),
      endDrawer: NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                                'Passage d\'Order',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: ImageIcon(
                                AssetImage(
                                    'assets/images/icons/icons8-passage-ordres-96.png'),
                                size: 24,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      widget.name,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.star_outlined,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'MA0000012296',
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ntsDoubleToStr(1082.20),
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            Moment.now().format(
                                                "DD/MM/YYYY H:mm", true),
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 12),
                                          ),
                                        ],
                                      )),
                                      Container(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '+ ' + ntsDoubleToStr(1.80) + '%',
                                              style: TextStyle(
                                                  color: Colors.green)),
                                          Text(
                                            ntsDoubleToStr(0) + ' MAD',
                                            style: TextStyle(
                                                color: Colors.grey[800]),
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //Text(ntsDoubleToStr(seuilBas)),
                                    Icon(Icons.arrow_downward_sharp,
                                        color: Colors.red),
                                    Text(ntsDoubleToStr(seuilBas)),

                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.arrow_upward_sharp,
                                        color: Colors.green),
                                    Text(ntsDoubleToStr(seuilHaut))
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // give the tab bar a height [can change hheight to preferred height]
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: setColor(tabIndex),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Acheter',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Vendre',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _formAcheter(TypeCoursAchatDropdownValue, pr),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Color(0xFF140C24),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                'Situation Comptes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )),
                        Container(
                          color: Colors.grey[400],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 0, 10),
                                      child: Text(
                                        'Situation Du Compte N°',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 10, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                      child: Text(
                                        'Solde comptable',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(10806905.08),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                      child: Text(
                                        'Opération en cours',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                      child: Text(
                                        'Solde Dispo',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(10651323.05),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // second tab bar view widget
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _formVente(TypeCoursVenteDropdownValue, pr),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Color(0xFF140C24),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Container(
                              margin: EdgeInsets.all(8),
                              child: Text(
                                'Situation Comptes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            )),
                        Container(
                          color: Colors.grey[400],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(20, 10, 0, 10),
                                      child: Text(
                                        'Situation Du Compte N°',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 10, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                      child: Text(
                                        'En Portefeuile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(10806905.08),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                      child: Text(
                                        'En Cours d\'achat',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(0),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                      child: Text(
                                        'En Cours Vente',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                      child: Text(
                                        ntsDoubleToStr(10651323.05),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _formAcheter(TypeCoursAchatDropdownValue, pr) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKeyAcheter,
          autovalidateMode: autovalidateFormAchat,
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
                        'Type Cours',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child:
                          getTypeOrderAcheter(TypeCoursAchatDropdownValue, pr)),
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
                        'Cours',
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
                          color: CoursBorderTextFiledColor,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                          validator: (value) {
                            if (node.hasFocus) return null;
                            return checkCoursAchat(value);
                          },
                          keyboardType: TextInputType.number,
                          readOnly: typeCourAchat,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 2.0),
                            errorMaxLines: 1,
                            errorText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            border: InputBorder.none,
                          ),
                          controller: CoursAcheterController),
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
                        'Quantité',
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
                              setState(() {
                                BorderTextFiledColor = Colors.red;
                              });

                              return 'Veuillez entrer la quantité';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 2.0),
                            errorMaxLines: 1,
                            errorText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          controller: qteController),
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
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Type de validité',
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
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: getTypeValiditeAcheter(pr),
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
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Validité',
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
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            if (selectvalTypeValiditeAchat != 'Day') {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  validiteAchatController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 0),
                            errorMaxLines: 1,
                            errorText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            border: InputBorder.none,
                          ),
                          controller: validiteAchatController),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => _onSubmitFormAchat(),
                      child: Text('Acheter'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Annuler'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  _onSubmitFormAchat() async {
    if (_formKeyAcheter.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  _onSubmitFormVente() async {
    if (_formKeyVente.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  getTypeValiditeAcheter(pr) {
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
          value: selectvalTypeValiditeAchat,
          onChanged: (value) {
            setState(() {
              pr.show();

              if (value != 'Day') {
                typeValiditeAchat = true;
              } else {
                validiteAchatController.clear();
                typeValiditeAchat = false;
              }

              Future.delayed(Duration(seconds: 1)).then((value) {
                pr.hide().whenComplete(() {});
              });

              selectvalTypeValiditeAchat = value.toString();
            });
          },
          items: listTypeValiditeAchat.map((itemone) {
            return DropdownMenuItem(
                value: itemone, child: Center(child: Text(itemone)));
          }).toList(),
        ),
      ),
    );
  }

  getTypeOrderAcheter(TypeCoursAchatDropdownValue, pr) {
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
          value: selectvalAchat,
          onChanged: (value) {
            pr.show();

            setState(() {
              if (value == 'Market') {
                typeCourAchat = true;
              } else {
                typeCourAchat = false;
                CoursBorderTextFiledColor = Colors.grey;
                CoursAcheterController.clear();
              }

              selectvalAchat = value.toString();
              Future.delayed(Duration(seconds: 1)).then((value) {
                pr.hide().whenComplete(() {
                  print(pr.isShowing());
                });
              });
            });
          },
          items: listTypeCoursAchat.map((itemone) {
            return DropdownMenuItem(
                value: itemone, child: Center(child: Text(itemone)));
          }).toList(),
        ),
      ),
    );
  }

  getTypeValiditeVente(pr) {
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
          value: selectvalTypeValiditeVente,
          onChanged: (value) {
            setState(() {
              pr.show();

              if (value != 'Day') {
                typeValiditeVente = true;
              } else {
                validiteVenteController.clear();
                typeValiditeVente = false;
              }

              Future.delayed(Duration(seconds: 1)).then((value) {
                pr.hide().whenComplete(() {});
              });

              selectvalTypeValiditeVente = value.toString();
            });
          },
          items: listTypeValiditeVente.map((itemone) {
            return DropdownMenuItem(
                value: itemone, child: Center(child: Text(itemone)));
          }).toList(),
        ),
      ),
    );
  }

  void clearTextFiled() {
    CoursAcheterController.clear();
    CoursVenteController.clear();
  }

  checkCoursAchat(value) {
    bool ResultFromServer = true;
    if ((value == null || value.isEmpty) && typeCourAchat) {
      setState(() {
        CoursBorderTextFiledColor = Colors.red;
      });
      return 'Veuillez entrer le Cours';
    } else {
      setState(() {
        CoursBorderTextFiledColor = Colors.grey;
      });
    }
    if (num.tryParse(value) == null && !typeCourAchat) {
      return '$value n\'est pas un nombre valide';
    }

    if (selectvalAchat == 'Limit') {
      if (ResultFromServer) {
        if (double.parse(value) < seuilBas) {
          String errorMsg = 'la valeur $value doit être  supérieur à $seuilBas';
          awesomeDialogError(context, errorMsg, 'Error');
          return '$value supérieur à $seuilBas';
        }

        if (double.parse(value) > seuilHaut) {
          String errorMsg =
              'la valeur $value doit être  inférieur à $seuilHaut';
          awesomeDialogError(context, errorMsg, 'Error');
          return '$value inférieur à $seuilHaut';
        }

        return null;
      }
    }
  }

  checkCoursVente(value) {
    bool ResultFromServer = true;
    if ((value == null || value.isEmpty) && typeCourVente) {
      setState(() {
        CoursBorderTextFiledColorVente = Colors.red;
      });
      return 'Veuillez entrer le Cours';
    } else {
      setState(() {
        CoursBorderTextFiledColorVente = Colors.grey;
      });
    }
    if (num.tryParse(value) == null && !typeCourVente) {
      return '$value n\'est pas un nombre valide';
    }

    if (selectvalVente == 'Limit') {
      if (ResultFromServer) {
        if (double.parse(value) < seuilBas) {
          String errorMsg = 'la valeur $value doit être  supérieur à $seuilBas';
          awesomeDialogError(context, errorMsg, 'Error');
          return '$value supérieur à $seuilBas';
        }

        if (double.parse(value) > seuilHaut) {
          String errorMsg =
              'la valeur $value doit être  inférieur à $seuilHaut';
          awesomeDialogError(context, errorMsg, 'Error');
          return '$value inférieur à $seuilHaut';
        }

        return null;
      }
    }
  }

  _formVente(TypeCoursVenteDropdownValue, pr) => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKeyVente,
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
                        'Type Cours',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child:
                          getTypeOrderVendre(TypeCoursVenteDropdownValue, pr)),
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
                        'Cours',
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
                          color: CoursBorderTextFiledColorVente,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                          readOnly: typeCourVente,
                          validator: (value) {
                            if (node.hasFocus) return null;
                            return checkCoursVente(value);
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
                          controller: CoursVenteController),
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
                        'Quantité',
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
                              setState(() {
                                BorderTextFiledColor = Colors.red;
                              });

                              return 'Veuillez entrer la quantité';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 2.0),
                            errorMaxLines: 1,
                            errorText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 20),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                          controller: qteControllerVente),
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
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Type de validité',
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
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: getTypeValiditeVente(pr),
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
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        'Validité',
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
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextFormField(
                          readOnly: true,
                          onTap: () async {
                            if (selectvalTypeValiditeVente != 'Day') {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  validiteVenteController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            }
                          },
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 0),
                            errorMaxLines: 1,
                            errorText: '',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            border: InputBorder.none,
                          ),
                          controller: validiteVenteController),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () => _onSubmitFormVente(),
                      child: Text('Vendre'),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 30, vertical: 0)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Annuler'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  getTypeOrderVendre(TypeCoursVenteDropdownValue, pr) {
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
          value: selectvalVente,
          onChanged: (value) {
            pr.show();

            setState(() {
              if (value == 'Market') {
                typeCourVente = true;
              } else {
                typeCourVente = false;
                CoursBorderTextFiledColorVente = Colors.grey;
                CoursVenteController.clear();
              }
              selectvalVente = value.toString();
              if (selectvalVente != 'Limit') {
                clearTextFiled();
                BorderTextFiledColor = Colors.grey;
                CoursBorderTextFiledColor = Colors.grey;
              }
            });
            Future.delayed(Duration(seconds: 1)).then((value) {
              pr.hide().whenComplete(() {
                print(pr.isShowing());
              });
            });
          },
          items: listTypeCoursVente.map((itemone) {
            return DropdownMenuItem(
                value: itemone, child: Center(child: Text(itemone)));
          }).toList(),
        ),
      ),
    );
  }

  Future<bool> rebuild() async {
    if (!mounted) return false;

    autovalidateFormAchat = AutovalidateMode.always;
    return true;
  }
}
