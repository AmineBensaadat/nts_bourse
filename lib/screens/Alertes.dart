import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../shared/AlertesWidget.dart';

class Alertes extends StatefulWidget {
  const Alertes({
    super.key,
  });

  @override
  State<Alertes> createState() => _AlertesState();
}

class _AlertesState extends State<Alertes> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ButtonsTabBar(
                buttonMargin: EdgeInsets.fromLTRB(30, 7, 30, 2),
                radius: 15,
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                backgroundColor: Color(0xFF140C24),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/alertes72.png'),
                    ),
                    text: "Alertes",
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/alertes_0.png'),
                    ),
                    text: "créer allerte",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  AlertesWidget(),
                  Container(
                    color: Colors.white,
                    child: Text(''),
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
