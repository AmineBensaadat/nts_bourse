import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/svg.dart';

class Login2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Login - FRAME
    return Container(
        width: 393,
        height: 852,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: 0,
              left: 393,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 393,
                        height: 420,
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Transform.rotate(
                                angle: -180 * (math.pi / 180),
                                child: Container(
                                    width: 393,
                                    height: 420,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Rectangle1.png'),
                                          fit: BoxFit.fitWidth),
                                    )),
                              )),
                          Positioned(
                              top: 58,
                              left: -80,
                              child: Transform.rotate(
                                angle: -180 * (math.pi / 180),
                                child: Container(
                                    width: 233,
                                    height: 104,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Rectangle4241.png'),
                                          fit: BoxFit.fitWidth),
                                    )),
                              )),
                        ])),
                  ],
                ),
              )),
          Positioned(
              top: 490,
              left: 35,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 323,
                        height: 53.22088623046875,
                        decoration: BoxDecoration(),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                  width: 323,
                                  height: 53.22088623046875,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 322.9490661621094,
                                            height: 53.22088623046875,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(88),
                                                topRight: Radius.circular(88),
                                                bottomLeft: Radius.circular(88),
                                                bottomRight:
                                                    Radius.circular(88),
                                              ),
                                              color: Color.fromRGBO(
                                                  239, 239, 239, 1),
                                            ))),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Text(
                                          'Identifiant',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontFamily: 'Manrope',
                                              fontSize: 15.07925033569336,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Positioned(
                                        top: 13,
                                        left: 19,
                                        child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                            child: Stack(children: <Widget>[
                                              Positioned(
                                                  top: 4,
                                                  left: 4,
                                                  child: SvgPicture.asset(
                                                      'assets/images/identifiant.svg',
                                                      semanticsLabel:
                                                          'identifiant')),
                                            ]))),
                                  ]))),
                        ])),
                    SizedBox(height: 22),
                    Container(
                        width: 323,
                        height: 87,
                        decoration: BoxDecoration(),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0.0859375,
                              left: 0,
                              child: Container(
                                  width: 322.9490661621094,
                                  height: 53.22088623046875,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(88),
                                      topRight: Radius.circular(88),
                                      bottomLeft: Radius.circular(88),
                                      bottomRight: Radius.circular(88),
                                    ),
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                  ))),
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Text(
                                'Mot de passe',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Manrope',
                                    fontSize: 15.07925033569336,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Positioned(
                              top: 15,
                              left: 18,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 1,
                                        left: 4,
                                        child: SvgPicture.asset(
                                            'assets/images/lock.svg',
                                            semanticsLabel: 'lock')),
                                  ]))),
                          Positioned(
                              top: 15,
                              left: 284,
                              child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 4.5,
                                        left: 1,
                                        child: SvgPicture.asset(
                                            'assets/images/hidepasword.svg',
                                            semanticsLabel: 'hidepasword')),
                                  ]))),
                        ])),
                    SizedBox(height: 22),
                    Container(
                        width: 161,
                        height: 23,
                        decoration: BoxDecoration(),
                        child: Stack(children: <Widget>[
                          Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                        width: 32.29999923706055,
                                        height: 19,
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 32.29999923706055,
                                                  height: 19,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(95),
                                                      topRight:
                                                          Radius.circular(95),
                                                      bottomLeft:
                                                          Radius.circular(95),
                                                      bottomRight:
                                                          Radius.circular(95),
                                                    ),
                                                    color: Color.fromRGBO(
                                                        23, 23, 30, 1),
                                                  ))),
                                          Positioned(
                                              top: 1.899999976158142,
                                              left: 15.199999809265137,
                                              child: Container(
                                                  width: 15.199999809265137,
                                                  height: 15.199999809265137,
                                                  decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    borderRadius: BorderRadius
                                                        .all(Radius.elliptical(
                                                            15.199999809265137,
                                                            15.199999809265137)),
                                                  ))),
                                        ])),
                                    SizedBox(width: 8),
                                    Text(
                                      'Se souvenir de moi',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Color.fromRGBO(17, 12, 38, 1),
                                          fontFamily: 'AirbnbCereal_W_Bk',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.6428571428571428),
                                    ),
                                  ],
                                ),
                              )),
                        ])),
                    SizedBox(height: 22),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(88.70147705078125),
                          topRight: Radius.circular(88.70147705078125),
                          bottomLeft: Radius.circular(88.70147705078125),
                          bottomRight: Radius.circular(88.70147705078125),
                        ),
                        color: Color.fromRGBO(41, 126, 253, 1),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 9),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Se Connecter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Manrope',
                                fontSize: 18,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      'Mot de passe oublié ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(66, 133, 244, 1),
                          fontFamily: 'Manrope',
                          fontSize: 16.19807243347168,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ],
                ),
              )),
        ]));
  }
}
