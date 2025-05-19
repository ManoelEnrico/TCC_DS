// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_servicos/Screens/expandedCard.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({super.key});

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  var listFav = [];
  var favAtualizados = [];

  atualizaFav() async {
    ConsumidorServices favoService = ConsumidorServices();
    favoService
        .getFavoritosAtualizados(Util.consumidor.cod_consumidor)
        .then((value) {
      setState(() {
        if (value != null) favAtualizados = value;
      });
    });
  }

  var codigo = Util.consumidor.cod_consumidor;

  @override
  void initState() {
    super.initState();

    setState(() {
      ConsumidorServices favServices = ConsumidorServices();
      favServices.getFavoritosByConsumidor(codigo).then((value) {
        listFav.clear();

        if (value!.length > 0) {
          value.forEach((element) {
            listFav.add(element);
          });
        } else {
          listFav.clear();
        }
        setState(() {
           if (value != null) favAtualizados = value;
        });
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Expanded(
                //   child:
                Container(
                  //margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  height: 500,
                  child: ListView.builder(
                    itemCount: listFav.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      var isFavorito = false;

                      if (favAtualizados
                          .where((element) =>
                              listFav[index].cod_provedor ==
                              element.cod_provedor)
                          .isNotEmpty) {
                        isFavorito = true;
                      }

                      return ExpCard(
                        fav: favAtualizados,
                        AtualizaFav: atualizaFav,
                        isFavorito: isFavorito,
                        id: listFav[index].cod_provedor,
                        title: listFav[index].nome_provedor,
                        description: listFav[index].descricao,
                        content: listFav[index].servico,
                        numero: listFav[index].telefone,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildText() {
  return Text(
    "Apenas Consumidores tem acesso as listas de Favoritos.",
    style: TextStyle(
      fontSize: 30,
    ),
  );
}
