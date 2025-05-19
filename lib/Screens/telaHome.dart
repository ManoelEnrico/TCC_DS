// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tcc_servicos/Screens/card.dart';
import 'package:tcc_servicos/Screens/expandedCard.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/Services/provedor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

double altura = 280;

var ListP = [];

var servicoBaba = []; //
var servicoCuidadorDog = []; //
var servicoCuidadorIdoso = []; //
var servicoEletricista = []; //
var servicoEncanador = []; //
var servicoFax = []; //
var servicoJardineiro = []; //
var servicoPedreiro = []; //
var servicoPintor = [];
var servicoServente = [];

class _TelaHomeState extends State<TelaHome> {
  var favAtualizados = [];

  atualizaFav() async {
    ConsumidorServices favService = ConsumidorServices();
    favService
        .getFavoritosAtualizados(Util.consumidor.cod_consumidor)
        .then((value) {
      setState(() {
        if (value != null) favAtualizados = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      body: buildPagina(),
    );
  }

  @override
  void initState() {
    super.initState();

    if (Util.tipo == 1) {
      atualizaFav();
    }

    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.getProvedorbyServico("babá").then((value) {
      setState(() {
        servicoBaba = value!;
      });
    });

    provedorServices.getProvedorbyServico("pet").then((value) {
      setState(() {
        servicoCuidadorDog = value!;
      });
    });

    provedorServices.getProvedorbyServico("cuidador de idoso").then((value) {
      setState(() {
        servicoCuidadorIdoso = value!;
      });
    });

    provedorServices.getProvedorbyServico("eletricista").then((value) {
      setState(() {
        servicoEletricista = value!;
      });
    });

    provedorServices.getProvedorbyServico("encanador").then((value) {
      setState(() {
        servicoEncanador = value!;
      });
    });

    provedorServices.getProvedorbyServico("faxineiro").then((value) {
      setState(() {
        servicoFax = value!;
      });
    });

    provedorServices.getProvedorbyServico("jardineiro").then((value) {
      setState(() {
        servicoJardineiro = value!;
      });
    });

    provedorServices.getProvedorbyServico("pedreiro").then((value) {
      setState(() {
        servicoPedreiro = value!;
      });
    });

    provedorServices.getProvedorbyServico("pintor").then((value) {
      setState(() {
        servicoPintor = value!;
      });
    });

    provedorServices.getProvedorbyServico("servente").then((value) {
      setState(() {
        servicoServente = value!;
      });
    });
  }

  Widget buildPagina() {
    return Container(
      margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              border: Border.fromBorderSide(
                BorderSide(
                  width: 1.5,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
              ),
              buildBaba(),
              buildCuidadorDog(),
              buildCuidadoresIdosos(),
              buildEletricista(),
              buildEncanador(servicoEncanador),
              buildFax(),
              buildJardineiro(),
              buildPedreiro(),
              buildPintor(),
              buildServente(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEncanador(var servicos) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Encanadores:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoEncanador.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoEncanador[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoEncanador[index].cod_provedor,
                  nome: servicoEncanador[index].nome_provedor,
                  servico: servicoEncanador[index].servico,
                  preco: servicoEncanador[index].preco,
                  numero: servicoEncanador[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEletricista() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Eletricistas:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoEletricista.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoEletricista[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoEletricista[index].cod_provedor,
                  nome: servicoEletricista[index].nome_provedor,
                  servico: servicoEletricista[index].servico,
                  preco: servicoEletricista[index].preco,
                  numero: servicoEletricista[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFax() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Faxineiros(as):",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoFax.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoFax[index].cod_provedor == element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoFax[index].cod_provedor,
                  nome: servicoFax[index].nome_provedor,
                  servico: servicoFax[index].servico,
                  preco: servicoFax[index].preco,
                  numero: servicoFax[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPedreiro() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pedreiros:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoPedreiro.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoPedreiro[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoPedreiro[index].cod_provedor,
                  nome: servicoPedreiro[index].nome_provedor,
                  servico: servicoPedreiro[index].servico,
                  preco: servicoPedreiro[index].preco,
                  numero: servicoPedreiro[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildJardineiro() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Jardineiros:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoJardineiro.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoJardineiro[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoJardineiro[index].cod_provedor,
                  nome: servicoJardineiro[index].nome_provedor,
                  servico: servicoJardineiro[index].servico,
                  preco: servicoJardineiro[index].preco,
                  numero: servicoJardineiro[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCuidadorDog() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cuidadores de pet:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoCuidadorDog.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoCuidadorDog[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoCuidadorDog[index].cod_provedor,
                  nome: servicoCuidadorDog[index].nome_provedor,
                  servico: servicoCuidadorDog[index].servico,
                  preco: servicoCuidadorDog[index].preco,
                  numero: servicoCuidadorDog[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBaba() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Babás:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoBaba.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoBaba[index].cod_provedor == element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoBaba[index].cod_provedor,
                  nome: servicoBaba[index].nome_provedor,
                  servico: servicoBaba[index].servico,
                  preco: servicoBaba[index].preco,
                  numero: servicoBaba[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPintor() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pintores:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoPintor.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoPintor[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoPintor[index].cod_provedor,
                  nome: servicoPintor[index].nome_provedor,
                  servico: servicoPintor[index].servico,
                  preco: servicoPintor[index].preco,
                  numero: servicoPintor[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServente() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Serventes de Pedreiro:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoServente.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoServente[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoServente[index].cod_provedor,
                  nome: servicoServente[index].nome_provedor,
                  servico: servicoServente[index].servico,
                  preco: servicoServente[index].preco,
                  numero: servicoServente[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCuidadoresIdosos() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cuidadores de Idosos:",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: altura,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: servicoCuidadorIdoso.length,
              itemBuilder: (BuildContext ctxt, int index) {
                var isFavorito = false;

                if (favAtualizados
                    .where((element) =>
                        servicoCuidadorIdoso[index].cod_provedor ==
                        element.cod_provedor)
                    .isNotEmpty) {
                  isFavorito = true;
                }
                return MostraCard(
                  fav: favAtualizados,
                  AtualizaFav: atualizaFav,
                  isFavorito: isFavorito,
                  id: servicoCuidadorIdoso[index].cod_provedor,
                  nome: servicoCuidadorIdoso[index].nome_provedor,
                  servico: servicoCuidadorIdoso[index].servico,
                  preco: servicoCuidadorIdoso[index].preco,
                  numero: servicoCuidadorIdoso[index].telefone,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
