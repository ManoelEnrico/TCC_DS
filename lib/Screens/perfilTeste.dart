import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class TestePerfil extends StatefulWidget {
  TestePerfil({required this.prov});
  final Provedor prov;

  @override
  State<TestePerfil> createState() => _TestePerfilState();
}

class _TestePerfilState extends State<TestePerfil> {
  final double coverHeight = 100;
  final double profileHeight = 144;
  double valorIcon = -1;
  double tmlist = 200;

  var ListProv = [];

  @override
  void initState() {
    super.initState();

    var provedor = Provedor(
        nome_provedor: widget.prov.nome_provedor,
        email_provedor: widget.prov.email_provedor,
        telefone: widget.prov.telefone,
        cidade_provedor: widget.prov.cidade_provedor,
        bairro: widget.prov.bairro,
        servico: widget.prov.servico,
        descricao: widget.prov.descricao,
        preco: widget.prov.preco,
        data_hora: widget.prov.data_hora);

    ListProv.add(provedor);
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
              color: Colors.white,
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
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Container(
                        height: tmlist,
                        child: buildList(),
                      ),
                    ],
                  ),
                ),
                Center(
                    child: Column(
                  children: [
                    //buildRating(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      valorIcon != -1 ? valorIcon.toString() : "",
                      style: TextStyle(
                        fontSize: 20,
                      ),
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

  Widget buildRating() {
    return RatingBar.builder(
      allowHalfRating: true,
      initialRating: 3,
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return Text("");
        }
      },
      onRatingUpdate: (rating) {
        setState(() {
          valorIcon = rating;
        });
        //print(rating);
      },
    );
  }

  Widget buildList() {
    return Container(
      child: ListView.builder(
        itemCount: ListProv.length,
        itemBuilder: ((context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome: ${ListProv[index].nome_provedor}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "E-mail: ${ListProv[index].email_provedor}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                  width: 100,
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                Text(
                  "Telefone: ${Util.provedor.telefone}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Cidade: ${ListProv[index].cidade_provedor}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),

                SizedBox(
                  height: 5,
                ),
                Divider(color: Colors.black),
                Text(
                  "Bairro: ${ListProv[index].bairro}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Serviço: ${ListProv[index].servico}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Descrição: ${ListProv[index].descricao}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Preço: ${ListProv[index].preco}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Divider(color: Colors.black),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Horário: ${ListProv[index].data_hora}",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            )),
      ),
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
        color: Color(0XFF763EF7),
        width: double.infinity,
        height: coverHeight,
      );

  Widget buildProfileImage() => CircleAvatar(
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.blue.shade900,
          child: Icon(
            Icons.account_circle_outlined,
            size: profileHeight,
          ),
        ),
        radius: 84,
        backgroundColor: Color(0xFFa3b7eb),
      );
}
