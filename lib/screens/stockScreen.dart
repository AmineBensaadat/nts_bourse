import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nts_bourse_app/screens/dashboard.dart';
import 'package:nts_bourse_app/screens/setOrder.dart';
import 'package:nts_bourse_app/shared/appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:moment_dart/moment_dart.dart';
import '../services/ntsoft.dart';
import '../shared/NavDrawer.dart';

class Stock extends StatefulWidget {
  //Stock({Key? key}) : super(key: key);
  final String name;
  const Stock({required this.name});
  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  int _selectedIndex = 0;
  String _timeString = '';
  //List<ChartData> _chartData = [];
  late List<ChartData> chartData;

  void _onItemTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Dashboard(index: index)),
    );
  }

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    chartData = [
      ChartData(DateTime(2022, 01, 01, 09, 12), 80),
      ChartData(DateTime(2022, 02, 02, 09, 13), 45),
      ChartData(DateTime(2022, 03, 03, 09, 14), 90),
      ChartData(DateTime(2022, 04, 04, 09, 15), 51),
      ChartData(DateTime(2022, 05, 10, 09, 01), 90),
      ChartData(DateTime(2022, 06, 06, 09, 16), 41),
      ChartData(DateTime(2022, 07, 06, 09, 16), 90),
      ChartData(DateTime(2022, 07, 06, 09, 16), 40),
      ChartData(DateTime(2022, 07, 10, 09, 16), 90),
      ChartData(DateTime(2022, 07, 11, 09, 16), 40),
      ChartData(DateTime(2022, 07, 12, 09, 16), 50),
      ChartData(DateTime(2022, 07, 15, 09, 16), 60),
      ChartData(DateTime(2022, 07, 20, 09, 16), 70),
    ];
    super.initState();
    _selectedIndex = _selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    Moment.setGlobalLocalization(MomentLocalizations.fr());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 252, 255),
      appBar: AppbarWidget(),
      endDrawer: NavDrawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 45,
                      child: IconButton(
                        color: Colors.black,
                        icon: const Icon(
                          Icons.keyboard_backspace_rounded,
                          size: 32,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Color(0xFF140C24),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'text her',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.star_outlined,
                                color: Colors.amber,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                ntsDoubleToStr(1082.20),
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(ntsDoubleToStr(0) + ' MAD',
                                      style: TextStyle(fontSize: 14)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    child: Text(
                                  '+' + ntsDoubleToStr(1.8) + '%',
                                  style: TextStyle(color: Colors.green),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                Moment.now().format("DD/MM/YYYY H:mm", true),
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bas',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        ntsDoubleToStr(350),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Seuil Haut',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        ntsDoubleToStr(1121),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Heure Marché',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        _timeString,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Cotation',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Active',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Phase',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'Regular Triding',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'PTO',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        '_',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CMP',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        ntsDoubleToStr(350),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Volume',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Container(
                                        child: Text(
                                          ntsDoubleToStr(350),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Nbr transactions',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        textAlign: TextAlign.right,
                                        '15',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        'Graphique',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        //color: Colors.blue,
                        height: 200,
                        child: SfCartesianChart(
                          enableAxisAnimation: true,
                          trackballBehavior: TrackballBehavior(
                              enable: true,
                              markerSettings: const TrackballMarkerSettings(
                                  height: 10,
                                  width: 10,
                                  markerVisibility:
                                      TrackballVisibilityMode.visible,
                                  borderColor: Colors.black,
                                  borderWidth: 4,
                                  color: Colors.blue),
                              activationMode: ActivationMode.singleTap,
                              builder: (context, trackballDetails) {
                                return SizedBox(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${trackballDetails.groupingModeInfo!.points[0].y}%",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 5)),
                                      Text(
                                        DateFormat('hh:mm').format(
                                            trackballDetails
                                                .groupingModeInfo!.points[0].x),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              tooltipDisplayMode:
                                  TrackballDisplayMode.groupAllPoints,
                              tooltipAlignment: ChartAlignment.near),

                          //backgroundColor: Colors.black,
                          plotAreaBorderWidth: 0, // X top line
                          plotAreaBorderColor: Colors.white24,
                          primaryXAxis: DateTimeAxis(
                            // Interval type will be months
                            intervalType: DateTimeIntervalType.days,
                            interval: 15,
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            labelRotation: 90,
                            majorTickLines: const MajorTickLines(
                                width: 0), // Little sticks below X line
                            majorGridLines: const MajorGridLines(
                              width: 0.5,
                              color: Colors.transparent,
                            ),
                            axisLine: const AxisLine(
                                // X bottom line
                                color: Colors.white24,
                                dashArray: <double>[5, 5]),
                          ),
                          primaryYAxis: NumericAxis(
                            interval: 20,
                            majorGridLines: const MajorGridLines(
                                width: 1,
                                color: Colors.white24,
                                dashArray: <double>[5, 5]),
                            majorTickLines: const MajorTickLines(
                                width: 0), // Little sticks on left side
                            axisLine: const AxisLine(
                                color: Colors.transparent, // Y left line
                                dashArray: <double>[5, 5]),
                            minimum: 0,
                            maximum: 100,
                          ),
                          series: <ChartSeries<ChartData, DateTime>>[
                            AreaSeries(
                                borderColor: Colors.blue,
                                borderWidth: 3,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.withOpacity(0.4),
                                      Colors.blue.withOpacity(0.2),
                                      Colors.blue.withOpacity(0.1)
                                    ],
                                    stops: const [
                                      0.1,
                                      0.3,
                                      0.6
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ],
                        )
                        // SfCartesianChart(
                        //   primaryYAxis: NumericAxis(
                        //       edgeLabelPlacement: EdgeLabelPlacement.shift),
                        //   primaryXAxis: CategoryAxis(
                        //       // Axis labels will be rotated to 90 degree
                        //       labelRotation: 90),
                        //   //enableAxisAnimation: true,
                        //   series: <ChartSeries>[
                        //     AreaSeries<ChartData, String>(
                        //         dataSource: _chartData,
                        //         xValueMapper: (ChartData sales, _) => sales.x,
                        //         yValueMapper: (ChartData sales, _) => sales.y)
                        //   ],
                        // ),
                        ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                  child: Text(
                    'Profondeur',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  constraints:
                      BoxConstraints(minHeight: 150, minWidth: double.infinity),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    color: Color.fromARGB(255, 3, 189, 111),
                                    child: Center(
                                        child: Text('Achat',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  Container(
                                      child: Table(
                                    children: <TableRow>[
                                      TableRow(
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 206, 205, 205)),
                                          children: [
                                            Text(
                                              "Order",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            Text(
                                              "Qnté",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            Text(
                                              "Cours",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ]),
                                      TableRow(
                                        decoration: const BoxDecoration(),
                                        children: <Widget>[
                                          Text(
                                            "2",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            "2",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          Text(
                                            ntsDoubleToStr(17),
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                                      TableRow(
                                        decoration: const BoxDecoration(),
                                        children: <Widget>[
                                          Text(
                                            "56",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          Text(
                                            textAlign: TextAlign.center,
                                            "96",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          Text(
                                            ntsDoubleToStr(120),
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    color: Color.fromARGB(255, 244, 82, 54),
                                    child: Center(
                                        child: Text(
                                      'Vente',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  Container(
                                    child: Table(
                                      children: <TableRow>[
                                        TableRow(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 206, 205, 205)),
                                            children: [
                                              Text(
                                                "Cours",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              Text(
                                                "Qnté",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              Text(
                                                textAlign: TextAlign.right,
                                                "Order",
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                            ]),
                                        TableRow(
                                          decoration: const BoxDecoration(),
                                          children: <Widget>[
                                            Text(
                                              ntsDoubleToStr(17),
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            Text(
                                              textAlign: TextAlign.center,
                                              "2",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            Text(
                                              textAlign: TextAlign.right,
                                              "2",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                        TableRow(
                                          decoration: const BoxDecoration(),
                                          children: <Widget>[
                                            Text(
                                              ntsDoubleToStr(15),
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            Text(
                                              textAlign: TextAlign.center,
                                              "30",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                            Text(
                                              textAlign: TextAlign.right,
                                              "11",
                                              style: TextStyle(fontSize: 15.0),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  color: Colors.grey[200],
                  margin: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 40,
                              margin: EdgeInsets.only(bottom: 0),
                              child: IconButton(
                                color: Colors.grey,
                                icon: const ImageIcon(
                                  AssetImage(
                                      'assets/images/icons/icons8-alarme2-96.png'),
                                  size: 50,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Dashboard(index: 3)),
                                  );
                                },
                              ),
                            ),
                            Container(
                                child: Text(
                              'Alerts',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetOrder(
                                      name: widget.name, selectedTab: 0)),
                            );
                          },
                          child: Text(
                            "ACHETER",
                            style: TextStyle(fontSize: 13),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 6)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27))),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetOrder(
                                      name: widget.name, selectedTab: 1)),
                            );
                          },
                          child: Text(
                            "VENDRE",
                            style: TextStyle(fontSize: 13),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 6)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(27))),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
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
      ),
    );
  }

  Widget _buildIcon(String iconData, String text, int index) => Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Material(
          color: Color(0xFF140C24),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ImageIcon(
                  AssetImage(iconData),
                  size: 24,
                ),
                Text(text, style: TextStyle(fontSize: 12, color: Colors.white)),
              ],
            ),
            onTap: () => _onItemTapped(index),
          ),
        ),
      );

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    if (!mounted) return;
    setState(() {
      _timeString = formattedDateTime;
    });
  }
}

String _formatDateTime(DateTime dateTime) {
  return DateFormat('hh:mm:ss').format(dateTime);
}

class ChartData {
  final DateTime x;
  final num y;

  ChartData(this.x, this.y);
}
