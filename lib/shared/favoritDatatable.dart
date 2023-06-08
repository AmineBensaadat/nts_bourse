import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../model/fav.dart';

class FavoritWidgetDatatable extends StatefulWidget {
  const FavoritWidgetDatatable({
    super.key,
  });

  @override
  State<FavoritWidgetDatatable> createState() => _FavoritWidgetDatatableState();
}

class _FavoritWidgetDatatableState extends State<FavoritWidgetDatatable> {
  late List<Fav> Favs;
  int? sortColumnIndex;
  bool isAscending = false;

  final allFavs = <Fav>[
    Fav(
        favName: 'AFMA',
        vol: 'vol 108 908.78',
        variation: 37,
        lastPrice: 1080.00,
        is_Fav: true),
    Fav(
        favName: 'Afriqia Gaz',
        vol: 'vol 98 908.78',
        variation: 0.02,
        lastPrice: 980.00,
        is_Fav: true),
    Fav(
        favName: 'Aliance',
        vol: 'vol 505.78',
        variation: -0.80,
        lastPrice: 3300.00,
        is_Fav: true),
    Fav(
        favName: 'Atlanta',
        vol: 'vol 903 68.78',
        variation: 0.10,
        lastPrice: 166.00,
        is_Fav: true),
    Fav(
        favName: 'Auto Hall',
        vol: 'vol 904 68.78',
        variation: 0.00,
        lastPrice: 0.00,
        is_Fav: true),
    Fav(
        favName: 'AFMA',
        vol: 'vol 108 908.78',
        variation: 37,
        lastPrice: 1080.00,
        is_Fav: true),
    Fav(
        favName: 'Afriqia Gaz',
        vol: 'vol 98 908.78',
        variation: 0.02,
        lastPrice: 980.00,
        is_Fav: true),
    Fav(
        favName: 'Aliance',
        vol: 'vol 505.78',
        variation: -0.80,
        lastPrice: 3300.00,
        is_Fav: true),
    Fav(
        favName: 'Atlanta',
        vol: 'vol 903 68.78',
        variation: 0.10,
        lastPrice: 166.00,
        is_Fav: true),
    Fav(
        favName: 'Auto Hall',
        vol: 'vol 904 68.78',
        variation: 0.00,
        lastPrice: 0.00,
        is_Fav: true),
    Fav(
        favName: 'AFMA',
        vol: 'vol 108 908.78',
        variation: 37,
        lastPrice: 1080.00,
        is_Fav: true),
    Fav(
        favName: 'Afriqia Gaz',
        vol: 'vol 98 908.78',
        variation: 0.02,
        lastPrice: 980.00,
        is_Fav: true),
    Fav(
        favName: 'Aliance',
        vol: 'vol 505.78',
        variation: -0.80,
        lastPrice: 3300.00,
        is_Fav: true),
    Fav(
        favName: 'Atlanta',
        vol: 'vol 903 68.78',
        variation: 0.10,
        lastPrice: 166.00,
        is_Fav: true),
    Fav(
        favName: 'Auto Hall',
        vol: 'vol 904 68.78',
        variation: 0.00,
        lastPrice: 0.00,
        is_Fav: true),
  ];

  @override
  void initState() {
    super.initState();

    this.Favs = List.of(allFavs);
  }

  @override
  Widget build(BuildContext context) {
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

    final columns = ['Nom / Vol', 'Dernier prix', 'Variation'];
    //Create an instance of ProgressDialog
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            columnSpacing: 30,
            sortAscending: isAscending,
            sortColumnIndex: sortColumnIndex,
            columns: getColumns(columns),
            rows: grtRows(Favs, pr)),
      ),
    );
  }

  Widget getVariation(variation, Fav, pr) {
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
              width: 80, //
              child: Center(
                  child: Text(variation.toStringAsFixed(2) + ' %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          IconButton(
            icon: const Icon(Icons.star),
            color: Colors.amber,
            onPressed: () {
              setState(() {
                // show dialog
                pr.show();
                setFav(Fav, pr);
              });
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
              width: 80, //
              child: Center(
                  child: Text(variation.toStringAsFixed(2) + ' %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          IconButton(
            icon: const Icon(Icons.star),
            color: Colors.amber,
            onPressed: () {
              setState(() {
                // show dialog
                pr.show();
                setFav(Fav, pr);
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
              width: 80, //
              child: Center(
                  child: Text(variation.toStringAsFixed(2) + ' %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          IconButton(
            icon: const Icon(Icons.star),
            color: Colors.amber,
            onPressed: () {
              setState(() {
                // show dialog
                pr.show();
                setFav(Fav, pr);
              });
            },
          ),
        ],
      );
    }
  }

  setFav(data, pr) async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        print('call function');
        pr.hide();
      });
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> grtRows(List<Fav> Favs, pr) => Favs.map((Fav Fav) {
        return DataRow(cells: <DataCell>[
          DataCell(Container(
              margin: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Fav.favName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5), child: Text(Fav.vol)),
                ],
              ))),
          DataCell(getLastPrice(Fav.variation, Fav.lastPrice)),
          DataCell(
            getVariation(Fav.variation, Fav, pr),
          ),
        ]);
      }).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      Favs.sort(
          (Fav1, Fav2) => compareString(ascending, Fav1.favName, Fav2.favName));
    } else if (columnIndex == 1) {
      Favs.sort((Fav1, Fav2) => compareString(ascending, Fav1.vol, Fav2.vol));
    } else if (columnIndex == 2) {
      Favs.sort((Fav1, Fav2) =>
          compareString(ascending, '${Fav1.variation}', '${Fav2.variation}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

Widget getLastPrice(variation, lastPrice) {
  if (variation > 0) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            lastPrice.toStringAsFixed(2),
            style: TextStyle(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  } else if (variation < 0) {
    return Container(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(lastPrice.toStringAsFixed(2),
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  } else {
    return Container(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(lastPrice.toStringAsFixed(2),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
