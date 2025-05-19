import 'dart:io';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tcc_servicos/Models/favoritos.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MostraCard extends StatefulWidget {
  MostraCard({
    super.key,
    required this.id,
    required this.nome,
    required this.servico,
    required this.preco,
    required this.numero,
    required this.AtualizaFav,
    required this.fav,
    required this.isFavorito,
  });
  final int id;
  final String nome;
  final String servico;
  final String preco;
  final String? numero;
  final VoidCallback AtualizaFav;
  final List fav;
  final bool isFavorito;

  @override
  State<MostraCard> createState() => _MostraCardState();
}

final double profileHeight = 100;

class _MostraCardState extends State<MostraCard> {
  Color estrela = Colors.black;
  Icon favor = Icon(Icons.star_border_rounded);
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

    return Card(
      child: Container(
        height: double.infinity,
        width: 250,
        decoration: BoxDecoration(
          color: Color(0xFFBFFFF9),
          borderRadius: BorderRadius.circular(10),
         border: Border.fromBorderSide(
            BorderSide(
            width: 1.5,
            color: Colors.black,
            style: BorderStyle.solid),//BorderSide
),
          
        ),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: profileHeight / 2,
                backgroundColor: Colors.black,
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
                        Text(
                          widget.nome,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 120,
                          child: Wrap(
                            children: [
                              Text(
                                widget.servico,
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
                                widget.preco,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
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
                        SizedBox(),
                        IconButton(
                          icon: Icon(
                            LineIcons.whatSApp,
                            color: Colors.green.shade800,
                          ),
                          tooltip: "WhatsApp",
                          onPressed: () {
                            openZap();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

  openZap() async {
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
