//https://stackoverflow.com/questions/63614648/how-to-launch-whatsapp-by-flutter
//https://stackoverflow.com/questions/63312503/i-want-to-launch-whatsapp-application-from-my-flutter-application

// ignore_for_file: unused_import

//import 'dart:html';
//import 'package:url_launcher/url_launcher.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tcc_servicos/Utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class TesteCard extends StatefulWidget {
  @override
  _TesteCardState createState() => _TesteCardState();
}

Color estrela = Colors.black;
Icon fav = Icon(Icons.star_border_rounded);

final double profileHeight = 100;

class _TesteCardState extends State<TesteCard> {
  // void launchWhatsApp() async {
  //   String url() {
  //     if (Platform.isAndroid) {
  //       return "https://wa.me/";
  //     } else {
  //       return "https://api.whatsapp.com";
  //     }
  //   }

  //   if (await canLaunch(url())) {
  //     await launch(url());
  //   } else {
  //     throw 'Could not launch';
  //   }
  // }

  var number = Util.provedor.telefone;

  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/1${number}');

    return Scaffold(
      body: Container(
          child: Column(
        children: [
          //Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          ExpansionTileCard(
            baseColor: Colors.cyan,
            expandedColor: Colors.indigoAccent.shade100,
            expandedTextColor: Colors.blueGrey.shade700,
            leading: CircleAvatar(
              radius: 40,
            ),
            title: Text(
              "Nome",
              //style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "Serviços",
              //style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              Divider(
                thickness: 1,
                height: 1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Descrição",
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: fav,
                            color: estrela,
                            tooltip: "Favoritos",
                            onPressed: () {
                              setState(() {
                                if (estrela == Colors.black) {
                                  estrela = Colors.yellow;
                                  fav = Icon(Icons.star_rounded);
                                } else {
                                  estrela = Colors.black;
                                  fav = Icon(Icons.star_border_rounded);
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Icon(
                              LineIcons.whatSApp,
                              color: Colors.green.shade800,
                            ),
                            tooltip: "WhatsApp",
                            onPressed: () {},
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTileCard(
            baseColor: Colors.cyan,
            expandedColor: Colors.indigoAccent.shade100,
            expandedTextColor: Colors.blueGrey.shade700,
            leading: CircleAvatar(
              radius: 40,
            ),
            title: Text(
              "Nome",
              //style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "Serviços",
              //style: TextStyle(color: Colors.black),
            ),
            children: <Widget>[
              Divider(
                thickness: 1,
                height: 1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Descrição",
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: fav,
                            color: estrela,
                            tooltip: "Favoritos",
                            onPressed: () {
                              setState(() {
                                if (estrela == Colors.black) {
                                  estrela = Colors.yellow;
                                  fav = Icon(Icons.star_rounded);
                                } else {
                                  estrela = Colors.black;
                                  fav = Icon(Icons.star_border_rounded);
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            icon: Icon(
                              LineIcons.whatSApp,
                              color: Colors.green.shade800,
                            ),
                            tooltip: "WhatsApp",
                            onPressed: () async {
                              launchUrl(whatsApp);
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            child: Container(
              height: 270,
              width: 233,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: profileHeight / 2,
                      backgroundColor: Color(0xFFa3b7eb),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: profileHeight,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nome"),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 120,
                                child: Wrap(
                                  children: [
                                    Text(
                                      "Serviço",
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 100,
                                child: Wrap(
                                  children: [
                                    Text(
                                      "Preço",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: fav,
                                color: estrela,
                                tooltip: "Favoritos",
                                onPressed: () {
                                  setState(() {
                                    if (estrela == Colors.black) {
                                      estrela = Colors.yellow;
                                      fav = Icon(Icons.star_rounded);
                                    } else {
                                      estrela = Colors.black;
                                      fav = Icon(Icons.star_border_rounded);
                                    }
                                  });
                                },
                              ),
                              SizedBox(),
                              IconButton(
                                icon: Icon(
                                  LineIcons.whatSApp,
                                  color: Colors.green.shade800,
                                ),
                                tooltip: "WhatsApp",
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
