import 'dart:io';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tcc_servicos/Models/favoritos.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExpCard extends StatefulWidget {
  ExpCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.numero,
    required this.AtualizaFav,
    required this.fav,
    required this.isFavorito,
  });
  final int id;
  final String title;
  final String description;
  final String content;
  final String? numero;
  final VoidCallback AtualizaFav;
  final List fav;
  final bool isFavorito;

  @override
  State<ExpCard> createState() => _ExpCardState();
}

Color estrela = Colors.black;
Icon favor = Icon(Icons.star_border_rounded);

class _ExpCardState extends State<ExpCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.isFavorito) {
      estrela = Colors.black;
      favor = Icon(Icons.star_border_rounded);
    } else {
      if (estrela == Colors.black) {
        estrela = Colors.yellow;
        favor = Icon(Icons.star_rounded);
      }
    }
    if (estrela == Colors.black) {
      estrela = Colors.yellow;
      favor = Icon(Icons.star_rounded);
    } else {
      estrela = Colors.black;
      favor = Icon(Icons.star_border_rounded);
    }

    return Column(
      children: [
        ExpansionTileCard(
          baseColor: Colors.white,
          expandedColor: Color(0xffB4FAC3),
          expandedTextColor: Colors.black,
          leading: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
             child: Icon(
            Icons.account_circle_outlined,
            size: 50,
            color: Colors.black,
          ),
          ),
          title: Text(widget.title),
          subtitle: Text(widget.content),
          children: <Widget>[
            
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
                    Text(widget.description),
                    Row(
                      children: [
                        IconButton(
                          icon: favor,
                          color: estrela,
                          tooltip: "Favoritos",
                          onPressed: () async {
                            if (Util.tipo == 1) {
                              await favo(widget.id);
                              setState(() {
                                widget.AtualizaFav;
                                if (!widget.isFavorito) {
                                  estrela = Colors.black;
                                  favor = Icon(Icons.star_border_rounded);
                                } else {
                                  if (estrela == Colors.black) {
                                    estrela = Colors.yellow;
                                    favor = Icon(Icons.star_rounded);
                                  }
                                }
                                if (estrela == Colors.black) {
                                  estrela = Colors.yellow;
                                  favor = Icon(Icons.star_rounded);
                                } else {
                                  estrela = Colors.black;
                                  favor = Icon(Icons.star_border_rounded);
                                }
                              });
                            } else {
                              showDialog(
                                  context: this.context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text("Aviso"),
                                        content: Text(
                                            "Apenas os Consumidores possuem acesso para adicionar Provedores aos Favoritos."),
                                        actions: <Widget>[
                                          Row(
                                            children: [
                                              TextButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ]);
                                  });
                            }
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          icon: Icon(
                            LineIcons.whatSApp,
                            color: Colors.green.shade800,
                          ),
                          tooltip: "WhatsApp",
                          onPressed: () {
                            showZap();
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  favo(int id) async {
    var favoritos = Favoritos(
      cod_consumidor: Util.consumidor.cod_consumidor,
      cod_provedor: id,
      star: 1,
    );
    ConsumidorServices cServices = ConsumidorServices();
    await cServices.IncluirFavorito(favoritos);
  }

  showZap() async {
    if (Util.tipo == 1) {
      var whatsapp = "${widget.numero}";
      var whatsappURL_android = "whatsapp://send?phone=" + whatsapp;
      var whatsappURL_ios = "http://wa.me/$whatsapp?";

      if (Platform.isIOS) {
        if (await canLaunchUrlString(whatsappURL_ios)) {
          await canLaunchUrlString(whatsappURL_ios);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("O WhatsApp não está instalado."),
          ));
        }
      } else {
        if (await canLaunchUrlString(whatsappURL_android)) {
          await canLaunchUrlString(whatsappURL_android);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("O WhatsApp não está instalado."),
          ));
        }
      }
    } else {
      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
                title: Text("Aviso"),
                content: Text(
                    "Apenas os Consumidores possuem acesso para conversar com os Provedores."),
                actions: <Widget>[
                  Row(
                    children: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ]);
          });
    }
  }
}
