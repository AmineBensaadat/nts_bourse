import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:nts_bourse_app/shared/favoritDatatable.dart';
import 'package:nts_bourse_app/shared/opcvm.dart';

import '../shared/marketWidget.dart';

class Market extends StatefulWidget {
  const Market({
    super.key,
  });

  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: ButtonsTabBar(
                center: false,
                radius: 15,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                backgroundColor: Color(0xFF140C24),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    text: "Favouris",
                    icon: Icon(
                      Icons.star_outlined,
                      color: Colors.amber,
                    ),
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage(
                          'assets/images/icons/icons8-chandeliers-96.png'),
                    ),
                    text: "Marché",
                  ),
                  Tab(
                    icon: ImageIcon(
                      AssetImage('assets/images/icons/actions24.png'),
                    ),
                    text: "OPCVM",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: FavoritWidgetDatatable(),
                  ),
                  Container(
                    color: Colors.white,
                    child: MarketWidget(),
                  ),
                  Container(
                    color: Colors.white,
                    child: OpcvmWidget(),
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
