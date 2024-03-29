import 'package:flutter/material.dart';
import '../services/ntsoft.dart';

class SyntheseWidget extends StatefulWidget {
  const SyntheseWidget({
    super.key,
  });

  @override
  State<SyntheseWidget> createState() => _SyntheseWidgetState();
}

class _SyntheseWidgetState extends State<SyntheseWidget> {
  @override
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
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 50),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Solde Comptable'),
                      Text(ntsDoubleToStr(121600.00))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Valorisation Action'),
                      Text(ntsDoubleToStr(12600.00))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Valorisation OPCVM'),
                      Text(ntsDoubleToStr(986548.00))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Des Avoirs',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ntsDoubleToStr(1256986.25),
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
                  child: Text('+/- values',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('+/- Latentes'),
                      Text(ntsDoubleToStr(1256986.00))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('+/- Réalisées'),
                      Text(ntsDoubleToStr(1256986.00))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+/- Values Totales',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ntsDoubleToStr(1256986.00),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    ],
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
