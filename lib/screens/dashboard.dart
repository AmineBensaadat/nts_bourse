import 'package:flutter/material.dart';
import 'package:nts_bourse_app/screens/market.dart';
import 'package:nts_bourse_app/screens/portefeuille.dart';
import 'package:nts_bourse_app/shared/appbar.dart';
import '../shared/NavDrawer.dart';
import 'Alertes.dart';
import 'News.dart';
import 'orders.dart';

class Dashboard extends StatefulWidget {
  //Dashboard({Key? key}) : super(key: key);
  final int index;
  const Dashboard({required this.index});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _selectedItemColor = Colors.white;
  final _unselectedItemColor = Colors.white30;
  final _selectedBgColor = Colors.blue;
  final _unselectedBgColor = Color(0xFF140C24);
  int _selectedIndex = 0;

  var tabs = [
    Market(),
    Portefeuille(),
    Orders(),
    Alertes(),
    News(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      tabs = [
        Market(),
        Portefeuille(),
        Orders(),
        Alertes(),
        News(),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  Color _getBgColor(int index) =>
      _selectedIndex == index ? _selectedBgColor : _unselectedBgColor;

  Color _getItemColor(int index) =>
      _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;

  Widget _buildIcon(String iconData, String text, int index) => Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Material(
          color: _getBgColor(index),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(iconData),
                  size: 24,
                ),
                Text(text,
                    style:
                        TextStyle(fontSize: 12, color: _getItemColor(index))),
              ],
            ),
            onTap: () => _onItemTapped(index),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 252, 255),
      appBar: AppbarWidget(),
      endDrawer: NavDrawer(),
      body: Container(
        child: tabs[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(
                'assets/images/icons/icons8-chandeliers-96.png', 'Marché', 0),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/icons/portefeuillexxxhdpi.png',
                'Portefeuille', 1),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                'assets/images/icons/ordresxxxhdpi.png', 'Ordres', 2),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/icons/alertes72.png', 'Alertes', 3),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon('assets/images/icons/News48.png', 'News', 4),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: _selectedItemColor,
        unselectedItemColor: _unselectedItemColor,
      ),
    );
  }
}
