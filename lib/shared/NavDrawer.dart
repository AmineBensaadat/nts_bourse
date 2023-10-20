import 'package:flutter/material.dart';
import 'package:nts_bourse_app/screens/changePassword.dart';
import 'package:nts_bourse_app/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Container(
                      width: 120,
                      child: Image.asset(
                        "assets/images/Fichier102.png",
                      )),
                ],
              ),
            ),
            ListTile(
              leading: new Stack(
                children: <Widget>[
                  new Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                  new Positioned(
                    right: 0,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 12,
                        minHeight: 12,
                      ),
                      child: new Text(
                        '17',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              title: Text('Notification'),
              onTap: () => {},
            ),
            ListTile(
              leading: Icon(
                Icons.lock_clock,
                size: 30,
              ),
              title: Text('Modifier mot de pass'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const changePassword()),
                )
              },
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: 30,
              ),
              title: Text('Déconnexion'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                )
              },
            ),
            ListTile(
              leading: Icon(
                Icons.quiz_sharp,
                size: 30,
              ),
              title: Text('A propos'),
              onTap: () => _launchURL(),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://www.nt-soft.ma/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
