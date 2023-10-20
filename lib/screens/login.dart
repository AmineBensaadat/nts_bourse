import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:nts_bourse_app/screens/dashboard.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../services/ntsoft.dart';
import 'package:xml/xml.dart';

import 'forgetPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/ImagesLogin.png"),
                          fit: BoxFit.fill),
                    ),
                    width: double.infinity,
                    height: 350,
                    child: FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      widthFactor: 0.4,
                      heightFactor: 0.35,
                      child: Container(
                        margin: EdgeInsets.only(top: 40),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/LogoBEL2022V3.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 40,
                ),
                LoginForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          MySession mySession = MySession();
                          if (mySession.host.isEmpty ||
                              (mySession.host.length == 0)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgetPassword()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgetPassword()),
                            );
                          }
                        },
                        child: Text(
                          " Mot de passe oublié",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

// Create a Form widget.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<LoginFormState>.
  final _formKey = GlobalKey<FormState>();

  String myloginvalue = '';
  String mypasseword = '';
  bool isSwitchOn = false;

  @override
  void initState() {
    super.initState();
    loadMySessionFromIniFile('session.ini');
    myloginvalue = '';
    mypasseword = '';
  }

  Widget build(BuildContext context) {
    //final loginController = TextEditingController();
    //final passwordController = TextEditingController();
    // Build a Form widget using the _formKey created above.
    MySession mySession = MySession();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Login
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                //controller: loginController,
                initialValue: myloginvalue,
                decoration: InputDecoration(
                  errorStyle: const TextStyle(height: 0),
                  errorMaxLines: 1,
                  errorText: '',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 10), // add padding to adjust icon
                    child: Icon(
                      Icons.person_2_outlined,
                      color: Colors.grey[900],
                    ),
                  ),
                  hintText: "Identifiant",
                  border: InputBorder.none,
                ),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty || (value.length == 0)) {
                    String errorMsg = 'l\'identifiant ne peut pas être vide';
                    awesomeDialogError(context, errorMsg, 'erreur');
                    return '';
                  }
                  return null;
                },
                onSaved: (value) {
                  myloginvalue = (value == null) ? '' : value;
                },
              ),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          //Password
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: TextFormField(
                obscureText: true,
                //controller: passwordController,
                decoration: InputDecoration(
                    errorStyle: TextStyle(height: 0),
                    errorMaxLines: 1,
                    errorText: '',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: 10), // add padding to adjust icon
                      child: Icon(
                        Icons.lock,
                        color: Colors.grey[900],
                      ),
                    ),
                    hintText: "Mot de passe",
                    border: InputBorder.none),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if ((myloginvalue.isNotEmpty) && (myloginvalue.length > 0)) {
                    if (value == null || value.isEmpty || (value.length == 0)) {
                      String errorMsg = 'Le mot de passe ne peut pas être vide';
                      awesomeDialogError(context, errorMsg, 'erreur');
                      return null;
                    }
                    ;
                  }
                  return null;
                },
                onSaved: (value) {
                  mypasseword = (value == null) ? '' : value;
                },
              ),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Souvenir de moi",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlutterSwitch(
                  height: 20.0,
                  width: 40.0,
                  padding: 4.0,
                  toggleSize: 15.0,
                  borderRadius: 10.0,
                  activeColor: Colors.blue,
                  value: isSwitchOn,
                  onToggle: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
                onPressed: () {
                  // setState(() {
                  //   // show dialog
                  //   pr.show();
                  //   setFav(pr);
                  // });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Dashboard(index: 0)),
                  // );

                  myloginvalue = '';
                  mypasseword = '';
                  _formKey.currentState!.save();
                  if (mySession.host.isEmpty || (mySession.host.length == 0)) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const Signup()),
                    // );
                  } else if (_formKey.currentState!.validate()) {
                    //ScaffoldMessenger.of(context).showSnackBar(
                    //  const SnackBar(content: Text('Processing Data')),
                    //);
                    _formKey.currentState!.save();
                    if ((myloginvalue.length > 0) && (mypasseword.length > 0)) {
                      execLogin(context, myloginvalue, mypasseword);
                    }
                  }
                },
                child: Text(
                  "Se Connecter",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all(Color(0xFFD66746)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 65, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                )),
          ),
        ],
      ),
    );
  }
}

execLogin(BuildContext context, String myLogin, String myPassword) async {
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
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

  try {
    pr.show();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Dashboard(index: 0)),
    );
  } catch (error) {
    print(error);
  }
  Future.delayed(Duration(seconds: 3)).then((value) {
    pr.hide().whenComplete(() {
      print(pr.isShowing());
    });
  });

  // MySession mySession = MySession();
  // mySession.idUser = 0;

  // XmlDocument xdoc = addAction('', '1', 'TEMP1', 'PROCEDURE', 'MAA', 'O');
  // xdoc = addParam(xdoc, '1', '0', 'Login_', myLogin, 'O');
  // xdoc = addParam(xdoc, '1', '0', 'PWD_', myPassword, 'O');

  // String x = xmlToString(xdoc);

  // try {
  //   //  Test de sauvegarde de session.INI
  //   mySession.host = '192.168.0.110';
  //   await saveMySessionToIniFile(mySession, 'session.ini');
  //   mySession.host = '';
  //   await loadMySessionFromIniFile('session.ini');
  //   //x = x + mySession.host;
  //   print(mySession.host);
  //   // On doit récupérer :  '192.168.0.110'
  // } catch (e) {
  //   print(e);
  // }

  // Execution de l'action de LOGIN sur Diam
  // String url = 'http://${mySession.host}:${mySession.port.toString()}/AOOA';
  // await sendPostRequest(url, mySession.token, 'AOOA', x, retourOkLogin,
  //     retourKoLogin, [context, url]);
}

Future<void> retourKoLogin(String error, List arguments) async {
  await awesomeDialogError(arguments[0], error, 'erreur');
  //************************************* */
  MySession mySession = MySession();
  mySession.tmpData = 'DashboardTwoColumnCards';

  Navigator.pushReplacement(
    arguments[0],
    MaterialPageRoute(builder: (context) => Dashboard(index: 0)),
  );

  return;
}

Future<void> retourOkLogin(String data, List arguments) async {
  MySession mySession = MySession();
  XmlDocument xdoc = stringToXml(data);
  mySession.idUser = ntsIntParse(getDocTag(xdoc, 'IdUser_'));
  mySession.annee = ntsIntParse(getDocTag(xdoc, 'AnneeEnCours_'));
  mySession.libuser = getDocTag(xdoc, 'LibUser_');
  mySession.idSession = getDocTag(xdoc, 'IdSession_');
  mySession.token = '';
  mySession.tmpData = getDocTag(xdoc, 'Message_');

  await saveMySessionToIniFile(mySession, 'session.ini');
  if (mySession.tmpData.length > 2) {
    awesomeDialogError(arguments[0], mySession.tmpData, 'erreur');
  } else {
    mySession.tmpData = 'DashboardTwoColumnCards';
    // Navigator.pushReplacement(
    //   arguments[0],
    //   MaterialPageRoute(builder: (context) => Dashboard()),
    // );
  }
  return;
}
