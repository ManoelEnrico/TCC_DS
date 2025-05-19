// ignore_for_file: unused_import, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:tcc_servicos/Models/consumidor.dart';
import 'package:tcc_servicos/Screens/telaLogin.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class Configuracoes extends StatefulWidget {
  Configuracoes({super.key});

  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  //Perfil
  bool editar = true; // é apenas leitura? sim/true ou não/false
  bool clickP = false;
  late FocusNode fname;
  var txtNome = TextEditingController();

//Segurança
  bool editarS = false;
  bool clickS = false;
  late FocusNode sname;
  var txtSenha = TextEditingController();

  confirmar() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content: Text(
                  "Você tem certeza que deseja alterar essas informações?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: certeza,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        child: Text("Não tenho"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ]);
        });
  }

  certeza() {
    var consumidor = Consumidor(
      cod_consumidor: Util.consumidor.cod_consumidor,
      nome_consumidor: Util.consumidor.nome_consumidor,
      email_consumidor: txtNome.text,
      senha_consumidor: txtSenha.text,
      cpf_consumidor: Util.consumidor.cpf_consumidor,
    );

    ConsumidorServices consumidorServices = ConsumidorServices();

    consumidorServices.AtualizarConsumidor(consumidor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Sua conta foi atualizada com sucesso."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      } else {
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Erro"),
                  content: Text(
                      "Algo deu errado, por favor confirme as informações e tente novamente."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      }
    });
  }

  deletar() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            title: Text("Aviso"),
            content: Text("Você tem certeza que deseja deletar a sua conta?"),
            actions: [
              Row(
                children: [
                  TextButton(
                    child: Text("Tenho"),
                    onPressed: certeza2,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      child: Text("Não tenho"),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ],
          );
        });
  }

  certeza2() {
    var consumidor = Consumidor(cod_consumidor: Util.consumidor.cod_consumidor);
    var consumidorServices = ConsumidorServices();
    consumidorServices.RemoverConsumidor(consumidor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Sua conta foi deletada com sucesso."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      } else {
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Erro"),
                  content: Text(
                      "Algo deu errado, por favor confirme as informações e tente novamente."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      }
    });
  }

  showEmail() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content: Text("Você tem certeza que deseja alterar seu E-mail?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editEmail,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        child: Text("Não tenho"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ]);
        });
  }

  editEmail() {
    var consumidor = Consumidor(
      cod_consumidor: Util.consumidor.cod_consumidor,
      nome_consumidor: Util.consumidor.nome_consumidor,
      email_consumidor: txtNome.text,
      senha_consumidor: Util.consumidor.senha_consumidor,
      cpf_consumidor: Util.consumidor.cpf_consumidor,
    );

    ConsumidorServices consumidorServices = ConsumidorServices();

    consumidorServices.AtualizarConsumidor(consumidor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Seu e-mail foi atualizado com sucesso."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      } else {
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Erro"),
                  content: Text(
                      "Algo deu errado, por favor confirme as informações e tente novamente."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      }
    });
  }

  showSenha() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content: Text("Você tem certeza que deseja alterar sua Senha?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editSenha,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        child: Text("Não tenho"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ]);
        });
  }

  editSenha() {
    var consumidor = Consumidor(
      cod_consumidor: Util.consumidor.cod_consumidor,
      nome_consumidor: Util.consumidor.nome_consumidor,
      email_consumidor: Util.consumidor.email_consumidor,
      senha_consumidor: txtSenha.text,
      cpf_consumidor: Util.consumidor.cpf_consumidor,
    );

    ConsumidorServices consumidorServices = ConsumidorServices();

    consumidorServices.AtualizarConsumidor(consumidor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Sua senha foi atualizada com sucesso."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      } else {
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Erro"),
                  content: Text(
                      "Algo deu errado, por favor confirme as informações e tente novamente."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    fname = FocusNode();
    fname.addListener(() {
      if (fname.hasFocus) {
        setState(() {
          if (clickP == true) {
            editar = false;
          }
        });
      } else {
        setState(() {
          editar = true;
          clickP = false;
        });
      }
    });

    sname = FocusNode();
    sname.addListener(() {
      if (sname.hasFocus) {
        setState(() {
          if (clickS == true) {
            editarS = true;
          }
        });
      } else {
        setState(() {
          editarS = false;
          clickS = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      body: buildPagina(),
    );
  }

  Widget buildPagina() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      //color: Colors.blueGrey,//
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Configurações",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      buildPerfil(),
                      SizedBox(
                        height: 30,
                      ),
                      buildSeguranca(),
                      Container(
                        margin: EdgeInsets.only(bottom: 10, top: 20),
                        child: ElevatedButton(
                          onPressed: confirmar,
                          child: Text(
                            "Confirmar Todas as Alterações",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      buildAjuda(),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: deletar,
                        child: Text(
                          "Deletar Conta",
                          style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(this.context);
                          Navigator.push(
                              this.context,
                              MaterialPageRoute(
                                  builder: (context) => TelaLogin()));
                        },
                        child: Text(
                          "Sair",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPerfil() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Perfil:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        Divider(color: Colors.black),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "Trocar e-mail",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  if (clickP == false) {
                    clickP = true;
                  }
                  fname.requestFocus();
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: txtNome,
          focusNode: fname,
          readOnly: editar,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Email: ${Util.consumidor.email_consumidor}",
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: showEmail,
            child: Text(
              "Alterar E-mail",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildSeguranca() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Segurança:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "Mudar senha",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  clickS = true;
                  sname.requestFocus();
                });
              },
            ),
          ],
        ),
        TextField(
          controller: txtSenha,
          focusNode: sname,
          readOnly: !editarS,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: showSenha,
            child: Text(
              "Alterar Senha",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildAjuda() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ajuda:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          SizedBox(
            height: 5,
          ),
          //"Ajuda (solicitações de suporte, reportar um problema)"
          Text("Solicitações de suporte:"),
          TextField(
            minLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Reportar Um problema:"),
          TextField(
            minLines: 1,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
