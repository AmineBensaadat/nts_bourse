import 'package:flutter/material.dart';

import '../services/ntsoft.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                      widthFactor: 0.5,
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
    //loadMySessionFromIniFile('session.ini');
    myloginvalue = '';
    mypasseword = '';
  }

  Widget build(BuildContext context) {
    //final loginController = TextEditingController();
    //final passwordController = TextEditingController();
    // Build a Form widget using the _formKey created above.
    //MySession mySession = MySession();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  color: Colors.black,
                  icon: const Icon(
                    Icons.keyboard_backspace_rounded,
                    size: 32,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Mot de passe oublié",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Saisissez votre adresse émail pour réinitialiser \n votre mot de passe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //Login
          FractionallySizedBox(
            widthFactor: 0.8,
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
                      Icons.email,
                      color: Colors.grey[900],
                    ),
                  ),
                  hintText: "Email obligatoire",
                  border: InputBorder.none,
                ),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty || (value.length == 0)) {
                    String errorMsg = 'l\'identifiant ne peut pas être vide';
                    awesomeDialogError(context, errorMsg);
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
            height: 15,
          ),
          //Password

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Envoyer",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all(Color(0xFFD66746)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 130, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                )),
          ),
        ],
      ),
    );
  }
}
