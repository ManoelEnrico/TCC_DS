// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tcc_servicos/Models/consumidor.dart';
import 'package:tcc_servicos/Screens/telaLogin.dart';

class PerfilConsimidor extends StatefulWidget {
  PerfilConsimidor({required this.consumi});
  final Consumidor consumi;

  @override
  State<PerfilConsimidor> createState() => _PerfilConsimidorState();
}

class _PerfilConsimidorState extends State<PerfilConsimidor> {
  final double coverHeight = 100;
  final double profileHeight = 144;
  double valorIcon = -1;

  var minhaLista = [];
  @override
  void initState() {
    super.initState();

    var consumidor = Consumidor(
      nome_consumidor: widget.consumi.nome_consumidor,
      email_consumidor: widget.consumi.email_consumidor,
    );

    minhaLista.add(consumidor);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      body: buildPagina(),
    );
  }

  Widget buildPagina() {
    final tomp = profileHeight / 2 + 30;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildTop(),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.circular(30),
              border: Border.fromBorderSide(
                BorderSide(
                  width: 1.5,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            margin: EdgeInsets.only(
              top: tomp,
              bottom: 15,
              left: 30,
              right: 30,
            ),
            width: double.infinity,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: buildList(),
                      )
                    ],
                  ),
                ),
                Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: minhaLista.length,
      itemBuilder: ((context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nome: ${minhaLista[index].nome_consumidor}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(color: Colors.black),
              SizedBox(
                height: 5,
              ),
              Text(
                "E-mail: ${minhaLista[index].email_consumidor}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(color: Colors.black),
            ],
          )),
    );
  }

  Widget buildTop() {
    final Top = coverHeight - profileHeight / 2;

    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(
            top: Top,
            child: buildProfileImage(),
          ),
        ]);
  }

  Widget buildCoverImage() => Container(
        color: Color(0xff8b455c),
        width: double.infinity,
        height: coverHeight,
      );

  Widget buildProfileImage() => CircleAvatar(
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Color(0xFF458b74),
          child: Icon(
            Icons.account_circle_outlined,
            size: profileHeight,
            color: Colors.black,
          ),
        ),
        radius: 84,
        backgroundColor: Color(0xFFa3b7eb),
      );
}
