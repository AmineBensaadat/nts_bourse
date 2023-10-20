import 'package:flutter/material.dart';

class AlertesWidget extends StatefulWidget {
  const AlertesWidget({
    super.key,
  });

  @override
  State<AlertesWidget> createState() => _AlertesWidgetState();
}

class AlertsList {
  String title;
  String detail;
  AlertsList({required this.title, required this.detail});
}

class _AlertesWidgetState extends State<AlertesWidget> {
  List<AlertsList> news = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      news = List.of([
        AlertsList(
          title: 'Important : Paiment de fividance Agenda 2',
          detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
        ),
        AlertsList(
            title: 'Important : Paiment de fividance Agenda 1',
            detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui'),
        AlertsList(
          title: 'Important : Paiment de fividance Agenda 2',
          detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
        ),
        AlertsList(
          title: 'Important : Paiment de fividance Agenda 2',
          detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
        ),
        AlertsList(
          title: 'Important : Paiment de fividance Agenda 2',
          detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
        ),
        AlertsList(
          title: 'Important : Paiment de fividance Agenda 2',
          detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
        ),
      ]);
    });
    ;
    return Container(
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                final singleNews = news[index];
                return getNewsCard(singleNews, context);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

getNewsCard(AlertsList singleNews, context) {
  return Card(
    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    color: Colors.white,
    borderOnForeground: true,
    elevation: 5,
    child: Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.brightness_1_rounded,
                        color: Colors.red,
                        size: 12,
                      ),
                    ),
                    Container(
                      child: Text(
                        (singleNews.title).length > 40
                            ? (singleNews.title).substring(0, 40) + '...'
                            : singleNews.title,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text(
                    (singleNews.detail).length > 40
                        ? (singleNews.detail).substring(0, 40) + '...'
                        : singleNews.detail,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

getStatusColors(String statut) {
  Color StatuColor = Colors.black;
  if (statut == 'En Cours') {
    StatuColor = Color.fromARGB(255, 255, 172, 78);
  }
  if (statut == 'Validée') {
    StatuColor = const Color.fromARGB(255, 145, 255, 149);
  }
  if (statut == 'Annulée') {
    StatuColor = const Color.fromARGB(255, 255, 137, 129);
  }
  return StatuColor;
}

void doNothing(BuildContext context) {}
