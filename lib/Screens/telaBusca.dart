import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_servicos/Screens/expandedCard.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/Services/provedor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  State<Pesquisa> createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  void updateList(String value) {}

  var ListP = [];
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

  var txtNome = TextEditingController();
  ProvedorServices pServices = ProvedorServices();

  @override
  void initState() {
    super.initState();

    if (Util.tipo == 1) {
      atualizaFav();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      appBar: AppBar(
        backgroundColor: Color(0xFFa3b7eb),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Buscar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
           SizedBox(
              height: 5,
            ),
            TextField(
              controller: txtNome,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.black,
                // enabledBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.redAccent),
                // ),
                // focusedBorder: OutlineInputBorder(
                //     borderSide: BorderSide(
                //   color: Colors.red,
                //   width: 1.5
                // )),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "ex: Babá",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () async {
                    if (!txtNome.text.isEmpty) {
                      await pServices
                          .getProvedorbyName(txtNome.text.toString())
                          .then((value) {
                        ListP.clear();

                        if (value!.length > 0) {
                          value.forEach((element) {
                            ListP.add(element);
                          });
                        }

                        setState(() {});
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: Text("Erro"),
                                content: Text(
                                    "A caixa de texto precisa ser preenchida para a pesquisa."),
                                actions: <Widget>[
                                  TextButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        
                                        
                                      })
                                ]);
                          });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 17,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                height: 800,
                child: ListView.builder(
                  itemCount: ListP.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    var isFavorito = false;

                      if (favAtualizados
                          .where((element) =>
                              ListP[index].cod_provedor ==
                              element.cod_provedor)
                          .isNotEmpty) {
                        isFavorito = true;
                      }
                    
                    return ExpCard(
                      fav: favAtualizados,
                      AtualizaFav: atualizaFav,
                      isFavorito: isFavorito,
                      id: ListP[index].cod_provedor,
                      title: ListP[index].nome_provedor,
                      description: ListP[index].descricao,
                      content: ListP[index].servico,
                      numero: ListP[index].telefone,
                    );
                  },
                  
                ),
                
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}
