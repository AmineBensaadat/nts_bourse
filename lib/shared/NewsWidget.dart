import 'package:flutter/material.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import '../services/ntsoft.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    super.key,
  });

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class NewsList {
  String title;
  String detail;
  String document;
  String documentType;
  NewsList(
      {required this.title,
      required this.detail,
      required this.document,
      required this.documentType});
}

class _NewsWidgetState extends State<NewsWidget> {
  String remotePDFpath = "";
  List<NewsList> news = [];
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
    setState(() {
      news = List.of([
        NewsList(
            title: 'Important : Paiment de fividance Agenda 2',
            detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
            document: 'https://www.sldttc.org/allpdf/21583473018.pdf',
            documentType: 'pdf'),
        NewsList(
            title: 'Important : Paiment de fividance Agenda 1',
            detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
            document: 'https://www.africau.edu/images/default/sample.pdf',
            documentType: 'pdf'),
        NewsList(
            title: 'Important : Paiment de fividance Agenda 5',
            detail: 'La Bourse de Casablanca a évolué a baisse aujourd \'hui',
            document:
                '<!DOCTYPE html><html><body><h1>My First Heading</h1><p>My first paragraph.</p></body></html>',
            documentType: 'html'),
      ]);
    });

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

                return getNewsCard(singleNews, context, remotePDFpath, pr);
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

getNewsCard(NewsList singleNews, context, remotePDFpath, pr) {
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
          if (singleNews.document.isNotEmpty) ...[
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  color: Colors.black,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 32,
                  ),
                  onPressed: () {
                    if (singleNews.documentType == 'pdf') {
                      createFileOfPdfUrl(singleNews.document, pr).then((f) {
                        remotePDFpath = f.path;
                        if (remotePDFpath.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PDFScreen(path: remotePDFpath),
                            ),
                          );
                        }
                      });
                    }

                    if (singleNews.documentType == 'html') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HtmlScreen(html: singleNews.document),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ]
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
