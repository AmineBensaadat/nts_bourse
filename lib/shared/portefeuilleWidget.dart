import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
//import 'package:syncfusion_flutter_gauges/gauges.dart';

class PortefeuilleWidget extends StatefulWidget {
  const PortefeuilleWidget({
    super.key,
  });

  @override
  State<PortefeuilleWidget> createState() => _PortefeuilleWidgetState();
}

class _PortefeuilleWidgetState extends State<PortefeuilleWidget> {
  List<dynamic> titres = [
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
    {
      "qte": 15,
      "valeur": "IAM",
      "cours": 5071.29,
      "valo": 1234.56,
      "PRMP": 12.80
    },
  ];
  List<dynamic> titresdData = [];
  @override
  void initState() {
    titresdData = titres;
    super.initState();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                color: Color(0xFF140C24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text('Portefeuille',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Numéro',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          Text('275544',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.grey[350],
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: Text(
                    'Synthése Compte',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _getRadialGauge(),
              Container(
                width: double.infinity,
                color: Colors.grey[350],
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: Text('Espèces - Compte N° 0283 X 000 963 542',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Solde Comptable'), Text('121 600.00')],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Opération en cours'), Text('12 600.00')],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Solde Disponible',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1256 986.00',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ]),
              ),
              Container(
                width: double.infinity,
                color: Colors.grey[350],
                child: Container(
                  margin: EdgeInsets.fromLTRB(15, 8, 8, 8),
                  child: Text('Titres - Portefeuile N° 275 544',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                child: DataTable(
                  columnSpacing: 30,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Qté'),
                    ),
                    DataColumn(
                      label: Text('Valeur'),
                    ),
                    DataColumn(
                      label: Text('Cours'),
                    ),
                    DataColumn(
                      label: Text('Valo'),
                    ),
                    DataColumn(
                      label: Text('PRMP'),
                    ),
                  ],
                  rows: List.generate(titresdData.length, (index) {
                    final item = titresdData[index];
                    return DataRow(
                      cells: [
                        DataCell(Text('${item['qte'] ?? ''}')),
                        DataCell(Text('${item['valeur'] ?? ''}')),
                        DataCell(
                            Text('${item['cours'].toStringAsFixed(2) ?? ''}')),
                        DataCell(
                            Text('${item['valo'].toStringAsFixed(2) ?? ''}')),
                        DataCell(
                            Text('${item['PRMP'].toStringAsFixed(2) ?? ''}')),
                      ],
                    );
                  }),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  double _volumeValue = 90;

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
  }

  _getRadialGauge() {
    return Container(
        width: 100,
        height: 100,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              minimum: 0,
              maximum: 100,
              startAngle: 270,
              endAngle: 270,
              showLabels: false,
              showTicks: false,
              radiusFactor: 0.6,
              axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothFlat,
                  color: Colors.black12,
                  thickness: 12),
              pointers: <GaugePointer>[
                RangePointer(
                  value: _volumeValue,
                  cornerStyle: CornerStyle.bothFlat,
                  width: 12,
                  sizeUnit: GaugeSizeUnit.logicalPixel,
                  color: Colors.black,
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    angle: 90,
                    axisValue: 5,
                    positionFactor: 0.1,
                    widget: Text(_volumeValue.ceil().toString() + '%',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)))
              ])
        ]));
  }
}
