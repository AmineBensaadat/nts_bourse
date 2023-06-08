import 'package:flutter/material.dart';

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
                // width: <put your desired width, recommended 24.0>,
                // height: <put your desired width, recommended 24.0>,
              ),
              onPressed: () {}),
          IconButton(
              color: Color(0xFF140C24),
              iconSize: 37,
              icon: const Icon(Icons.person_outlined),
              onPressed: () {})
        ],
        leadingWidth: 100,
        // ignore: unnecessary_new
        leading: Container(
          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
          child: Center(child: Image.asset("assets/images/LogoBEL2022V4.png")),
        ));
  }
}
