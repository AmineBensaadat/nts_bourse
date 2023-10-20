import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../screens/stockScreen.dart';
import '../services/ntsoft.dart';
// ignore: import_of_legacy_library_into_null_safe

class MatketObject {
  final String favName;
  final String vol;
  final double variation;
  final double lastPrice;
  final bool is_Fav;

  const MatketObject(
      {required this.favName,
      required this.vol,
      required this.variation,
      required this.lastPrice,
      required this.is_Fav});
}

class MarketWidget extends StatefulWidget {
  const MarketWidget({super.key});

  @override
  State<MarketWidget> createState() => MarketWidgetState();
}

class MarketWidgetState extends State<MarketWidget> {
  bool isAscending = false;
  int? sortColumnIndex;
  late List<MatketObject> MarketData;

  List<dynamic> data = [
    {
      "Name": "AFMA",
      "vol": "vol 108 908.78",
      "variation": 37,
      "lastPrice": 1080.00,
      "is_Fav": false
    },
    {
      "Name": "Aliance",
      "vol": "vol 505.78",
      "variation": -0.80,
      "lastPrice": 3300.00,
      "is_Fav": false
    },
    {
      "Name": "Atlanta",
      "vol": "vol 903 68.78",
      "variation": 0.10,
      "lastPrice": 166.00,
      "is_Fav": false
    },
    {
      "Name": "Auto Hall",
      "vol": "vol 108 908.78",
      "variation": 0.00,
      "lastPrice": 0.00,
      "is_Fav": false
    },
    {
      "Name": "Auto Hall",
      "vol": "vol 108 908.78",
      "variation": 0.00,
      "lastPrice": 0.00,
      "is_Fav": false
    },
    {
      "Name": "Aliance",
      "vol": "vol 505.78",
      "variation": -0.80,
      "lastPrice": 3300.00,
      "is_Fav": false
    },
    {
      "Name": "Auto Hall",
      "vol": "vol 108 908.78",
      "variation": 0.00,
      "lastPrice": 0.00,
      "is_Fav": false
    },
    {
      "Name": "AFMA",
      "vol": "vol 108 908.78",
      "variation": 37,
      "lastPrice": 1080.00,
      "is_Fav": false
    },
    {
      "Name": "Aliance",
      "vol": "vol 505.78",
      "variation": -0.80,
      "lastPrice": 3300.00,
      "is_Fav": false
    },
    {
      "Name": "AFMA",
      "vol": "vol 108 908.78",
      "variation": 37,
      "lastPrice": 1080.00,
      "is_Fav": false
    },
    {
      "Name": "Aliance",
      "vol": "vol 505.78",
      "variation": -0.80,
      "lastPrice": 3300.00,
      "is_Fav": false
    },
    {
      "Name": "AFMA",
      "vol": "vol 108 908.78",
      "variation": 37,
      "lastPrice": 1080.00,
      "is_Fav": false
    },
    {
      "Name": "Aliance",
      "vol": "vol 505.78",
      "variation": -0.80,
      "lastPrice": 3300.00,
      "is_Fav": false
    },
  ];
  List<dynamic> filteredData = [];

  final searchController = TextEditingController();

  @override
  void initState() {
    filteredData = data;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      filteredData = text.isEmpty
          ? data
          : data
              .where((item) =>
                  item['Name'].toLowerCase().contains(text.toLowerCase()) ||
                  item['lastPrice'].toString().contains(text) ||
                  item['variation'].toString().contains(text))
              .toList();
    });
  }

  Widget getVariation(variation, index, pr) {
    if (variation > 0) {
      return Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[400],
              ),
              margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
              height: double.infinity,
              width: 60, //
              child: Center(
                  child: Text(variation.toStringAsFixed(2) + ' %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          IconButton(
            icon: const Icon(Icons.star),
            color: (data[index]['is_Fav'] ? Colors.amber : Colors.black),
            onPressed: () {
              // show dialog
              pr.show();
              setFav(data[index], pr);
            },
          ),
        ],
      );
    } else if (variation < 0) {
      return Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
              height: double.infinity,
              width: 60, //
              child: Center(
                  child: Text(variation.toStringAsFixed(2) + ' %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          IconButton(
            icon: const Icon(Icons.star),
            color: (data[index]['is_Fav'] ? Colors.amber : Colors.black),
            onPressed: () {
              setState(() {
                // show dialog
                pr.show();
                setFav(data[index], pr);
              });
            },
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              margin: EdgeInsets.fromLTRB(0, 9, 0, 9),
              height: double.infinity,
              width: 60, //
              child: Center(
                  child: Text(variation.toString() + ' %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          IconButton(
            icon: const Icon(Icons.star),
            color: (data[index]['is_Fav'] ? Colors.amber : Colors.black),
            onPressed: () {
              setState(() {
                // show dialog
                pr.show();
                setFav(data[index], pr);
              });
            },
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final columns = ['Nom / Vol', 'Dernier prix', 'Variation'];
    //Create an instance of ProgressDialog
    final ProgressDialog pr = ProgressDialog(
      context,
      type: ProgressDialogType.normal,
      isDismissible: true,
      showLogs: true,
    );
    pr.style(
        message: 'Chargement ...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 50.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          height: 40,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Recherche',
              contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
              //border: OutlineInputBorder(),
              border: InputBorder.none,
            ),
            onChanged: _onSearchTextChanged,
          ),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 20,
              sortAscending: isAscending,
              sortColumnIndex: sortColumnIndex,
              columns: getColumns(columns),
              rows: List.generate(filteredData.length, (index) {
                final item = filteredData[index];

                return DataRow(
                  cells: [
                    DataCell(onTap: () {
                      showFav(item['Name']);
                    },
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['Name'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text(item['vol'])),
                              ],
                            ))),
                    DataCell(onTap: () {
                      showFav(item['Name']);
                    }, getLastPrice(item['lastPrice'])),
                    DataCell(onTap: () {
                      showFav(item['Name']);
                    }, getVariation(item['variation'], index, pr)),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    ]);
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      print(filteredData[0]);
      filteredData.sort((a, b) {
        return compareString(ascending, a['Name'], b['Name']);
      });
    } else if (columnIndex == 1) {
      filteredData.sort((a, b) => compareString(
          ascending, a['lastPrice'].toString(), b['lastPrice'].toString()));
    } else if (columnIndex == 2) {
      filteredData.sort((a, b) => compareString(
          ascending, a['variation'].toString(), b['variation'].toString()));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  setFav(data, pr) async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        data['is_Fav'] = !data['is_Fav'];
        pr.hide();
      });
    });
  }

  void showFav(name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Stock(name: name)),
    );
  }
}

Widget getLastPrice(lastPrice) {
  return Container(
    width: 70,
    margin: EdgeInsets.only(top: 5),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        ntsDoubleToStr(lastPrice),
        style: TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
