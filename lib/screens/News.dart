import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import '../shared/NewsWidget.dart';

class News extends StatefulWidget {
  const News({
    super.key,
  });

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: DefaultTabController(
        length: 1,
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
                      AssetImage('assets/images/icons/News48.png'),
                    ),
                    text: "Actualités",
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  NewsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
