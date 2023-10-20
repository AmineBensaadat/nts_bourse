import 'package:flutter/material.dart';
import '../screens/dashboard.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({
    super.key,
  });
  @override
  Size get preferredSize => const Size(double.maxFinite, 90);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        actions: [
          IconButton(
              icon: Image.asset(
                "assets/images/icons/MSG48.png",
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard(index: 4)),
                );
              }),
          IconButton(
              color: Color(0xFF140C24),
              iconSize: 37,
              icon: const Icon(Icons.person_outlined),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              })
        ],
        leadingWidth: 100,
        // ignore: unnecessary_new
        leading: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
          child: Center(child: Image.asset("assets/images/LogoBEL2022V4.png")),
        ));
  }
}
