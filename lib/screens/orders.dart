import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({
    super.key,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: DefaultTabController(
        length: 3,
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
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  backgroundColor: Color(0xFF140C24),
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: TextStyle(color: Colors.black),
                  labelStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      icon: ImageIcon(
                        AssetImage('assets/images/icons/action.png'),
                      ),
                      text: "Action",
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
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 2),
                            color: Colors.grey[300],
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Text(
                                'Mes Orders',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            )),
                        Container(
                            width: double.infinity,
                            color: Colors.grey[350],
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Valeur',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Qté',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Qté Executée',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Cours',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Text(
                                    'Echeance',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text('data 1'),
                  ),
                  Container(
                    color: Colors.white,
                    child: Text('data 2'),
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
