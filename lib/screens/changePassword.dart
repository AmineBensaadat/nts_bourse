import 'package:flutter/material.dart';

import '../services/ntsoft.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);
  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
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
                UpdatePasswordForm(),
              ],
            ),
          )),
    );
  }
}

// Create a Form widget.
class UpdatePasswordForm extends StatefulWidget {
  const UpdatePasswordForm({super.key});

  @override
  UpdatePasswordFormState createState() {
    return UpdatePasswordFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class UpdatePasswordFormState extends State<UpdatePasswordForm> {
  final _updatePasswordformKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  Widget build(BuildContext context) {
    return Form(
      key: _updatePasswordformKey,
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
                  "changer le  mot de passe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
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
                      Icons.pattern_outlined,
                      color: Colors.grey[900],
                    ),
                  ),
                  hintText: "Mot de passe actuel",
                  border: InputBorder.none,
                ),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty || (value.length == 0)) {
                    String errorMsg =
                        'Mot de passe actuel ne peut pas être vide';
                    awesomeDialogError(context, errorMsg, 'error');
                    return '';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

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
                controller: _pass,
                style: TextStyle(color: Colors.black),
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
                      Icons.password_outlined,
                      color: Colors.grey[900],
                    ),
                  ),
                  hintText: "Nouveau mot de passe",
                  border: InputBorder.none,
                ),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty || (value.length == 0)) {
                    String errorMsg =
                        'Nouveau mot de passe ne peut pas être vide';
                    awesomeDialogError(context, errorMsg, 'error');
                    return '';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

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
                controller: _confirmPass,
                style: TextStyle(color: Colors.black),
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
                      Icons.password_outlined,
                      color: Colors.grey[900],
                    ),
                  ),
                  hintText: "Confirmer le mot de passe",
                  border: InputBorder.none,
                ),

                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value != _pass.text) {
                    String errorMsg =
                        'Les mots de passe ne correspondent pas. ';
                    awesomeDialogError(context, errorMsg, 'error');
                    return '';
                  }

                  if (value == null || value.isEmpty || (value.length == 0)) {
                    String errorMsg =
                        'Confirmation de mot de passe ne peut pas être vide';
                    awesomeDialogError(context, errorMsg, 'error');
                    return '';
                  }
                  return null;
                },
                onSaved: (value) {},
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
                onPressed: () {
                  _updatePasswordformKey.currentState!.save();
                  if (_updatePasswordformKey.currentState!.validate()) {
                    _updatePasswordformKey.currentState!.save();
                  }
                },
                child: Text(
                  "Enregistrer",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all(Color(0xFFD66746)),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 110, vertical: 10)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27))),
                )),
          ),
        ],
      ),
    );
  }
}
