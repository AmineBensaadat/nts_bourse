import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:nts_bourse_app/shared/syntheseWidget.dart';

import '../shared/portefeuilleWidget.dart';

class Portefeuille extends StatefulWidget {
  Portefeuille({
    super.key,
  });

  @override
  State<Portefeuille> createState() => _PortefeuilleState();
}

class _PortefeuilleState extends State<Portefeuille> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: double.infinity,
              child: Center(
                child: ButtonsTabBar(
                  radius: 15,
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  buttonMargin: EdgeInsets.fromLTRB(40, 5, 40, 5),
                  backgroundColor: Color(0xFF140C24),
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: "Synthése",
                      icon: Icon(Icons.monetization_on_outlined),
                    ),
                    Tab(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/porte0_24.png'),
                      ),
                      text: "Portefeuille",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: SyntheseWidget(),
                  ),
                  Container(
                    color: Colors.white,
                    child: PortefeuilleWidget(),
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
