// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Screens/telaLogin.dart';
import 'package:tcc_servicos/Services/provedor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class ConfiguracoesP extends StatefulWidget {
  @override
  _ConfiguracoesPState createState() => _ConfiguracoesPState();
}

class _ConfiguracoesPState extends State<ConfiguracoesP> {
  var masktel = MaskTextInputFormatter(mask: ' (##) #####-####');

  var horaAM;

  var horaPM;

  tratadoAM(String hora, String minuto) {
    if (minuto == "1" ||
        minuto == "2" ||
        minuto == "3" ||
        minuto == "4" ||
        minuto == "5" ||
        minuto == "6" ||
        minuto == "7" ||
        minuto == "8" ||
        minuto == "9") {
      minuto = "0" + minuto;
    }
    if (minuto.length == 1) {
      minuto = minuto + "0";
    }
    horaAM = hora + ":" + minuto;
    return horaAM;
  }

  tratadoPM(String hora, String minuto) {
    if (minuto == "1" ||
        minuto == "2" ||
        minuto == "3" ||
        minuto == "4" ||
        minuto == "5" ||
        minuto == "6" ||
        minuto == "7" ||
        minuto == "8" ||
        minuto == "9") {
      minuto = "0" + minuto;
    }

    if (minuto.length == 1) {
      minuto = minuto + "0";
    }

    horaPM = hora + ":" + minuto;
    return horaPM;
  }

  tratarCampo(String minuto) {
    if (minuto == "1" ||
        minuto == "2" ||
        minuto == "3" ||
        minuto == "4" ||
        minuto == "5" ||
        minuto == "6" ||
        minuto == "7" ||
        minuto == "8" ||
        minuto == "9") {
      minuto = "0" + minuto;
    }
    if (minuto.length == 1)
      return minuto + "0";
    else
      return minuto;
  }

  bool encanador = false, //
      eletricista = false, //
      faxineira = false, //
      pedreiro = false, //
      jardineiro = false, //
      cuidador_dog = false, //
      baba = false, //
      pintor = false, //
      servente_pedreiro = false, //
      cuidador_idoso = false; //

  List<String> listPreco = <String>[
    '',
    'Entre R\$50 - R\$100',
    'Entre R\$150 - R\$200',
    'Entre R\$250 - R\$300',
    'Entre R\$350 - R\$400',
    'Entre R\$450 - R\$500',
    'Maior que R\$500'
  ];
  String preco = "";

  //Perfi
  bool editarP = false; //se é apenas leitura; false...sim|true...não
  bool clickP = false;
  late FocusNode pname;
  var txtEmail = TextEditingController();

  //Segurança
  bool editarS = false;
  bool clickS = false;
  late FocusNode sname;
  var txtSenha = TextEditingController();

  //telefone
  bool editarF = false;
  bool clickF = false;
  late FocusNode fname;
  var txtTelefone = TextEditingController();

  //cidade
  bool editarC = false;
  bool clickC = false;
  late FocusNode cname;
  var txtCidade = TextEditingController();

  //bairro
  bool editarB = false;
  bool clickB = false;
  late FocusNode bname;
  var txtBairro = TextEditingController();

  //descricao
  bool editarD = false;
  bool clickD = false;
  late FocusNode dname;
  var txtDescricao = TextEditingController();

  confirmar() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            title: Text("Aviso"),
            content: Text("Você tem certeza que deseja atualizar a sua conta?"),
            actions: [
              Row(
                children: [
                  TextButton(
                    child: Text("Tenho"),
                    onPressed: edicao,
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

  edicao() {
    String servico = "";

    if (encanador) {
      servico += "Encanador(a), ";
    }
    if (eletricista) {
      servico += "Eletricista, ";
    }
    if (faxineira) {
      servico += "Faxineiro(a), ";
    }
    if (pedreiro) {
      servico += "Pedreiro, ";
    }
    if (jardineiro) {
      servico += "Jardineiro(a), ";
    }
    if (cuidador_dog) {
      servico += "Cuidador de pet, ";
    }
    if (baba) {
      servico += "Babá, ";
    }
    if (pintor) {
      servico += "Pintor(a), ";
    }
    if (servente_pedreiro) {
      servico += "Servente de pedreiro, ";
    }
    if (cuidador_idoso) {
      servico += "Cuidador de idoso, ";
    }

    var horario = timeAM!.hour.toString() +
        ":" +
        tratarCampo(timeAM!.minute.toString()) +
        " até " +
        timePM!.hour.toString() +
        ":" +
        tratarCampo(timePM!.minute.toString());

    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      email_provedor: txtEmail.text,
      senha_provedor: txtSenha.text,
      telefone: txtTelefone.text,
      cidade_provedor: txtCidade.text,
      bairro: txtBairro.text,
      servico: servico,
      descricao: txtDescricao.text,
      preco: preco,
      data_hora: horario,
    );

    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
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
    var provedor = Provedor(cod_provedor: Util.provedor.cod_provedor);
    var provedorServices = ProvedorServices();
    provedorServices.RemoverProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TelaLogin()));
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
            context: context,
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
    preco = listPreco.first;

    super.initState();

    pname = FocusNode();
    pname.addListener(() {
      if (pname.hasFocus) {
        setState(() {
          if (clickP) editarP = true;
        });
      } else {
        setState(() {
          editarP = false;
          clickP = false;
        });
      }
    });

    sname = FocusNode();
    sname.addListener(() {
      if (sname.hasFocus) {
        setState(() {
          if (clickS) editarS = true;
        });
      } else {
        setState(() {
          editarS = false;
          clickS = false;
        });
      }
    });

    fname = FocusNode();
    fname.addListener(() {
      if (fname.hasFocus) {
        setState(() {
          if (clickF) editarF = true;
        });
      } else {
        setState(() {
          editarF = false;
          clickF = false;
        });
      }
    });

    cname = FocusNode();
    cname.addListener(() {
      if (cname.hasFocus) {
        setState(() {
          if (clickC) editarC = true;
        });
      } else {
        setState(() {
          editarC = false;
          clickC = false;
        });
      }
    });

    bname = FocusNode();
    bname.addListener(() {
      if (bname.hasFocus) {
        setState(() {
          if (clickB) editarB = true;
        });
      } else {
        setState(() {
          editarB = false;
          clickB = false;
        });
      }
    });

    dname = FocusNode();
    dname.addListener(() {
      if (dname.hasFocus) {
        setState(() {
          if (clickD) editarD = true;
        });
      } else {
        setState(() {
          editarD = false;
          clickD = false;
        });
      }
    });
  }

  TimeOfDay? timeAM = TimeOfDay(hour: 6, minute: 00);
  TimeOfDay? timePM = TimeOfDay(hour: 18, minute: 00);

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
                      SizedBox(
                        height: 30,
                      ),
                      buildTelefone(),
                      SizedBox(
                        height: 30,
                      ),
                      buildEndereco(),
                      SizedBox(
                        height: 30,
                      ),
                      buildServico(),
                      SizedBox(
                        height: 30,
                      ),
                      buildDescricao(),
                      SizedBox(
                        height: 30,
                      ),
                      buildPreco(),
                      SizedBox(
                        height: 20,
                      ),
                      buildHora(),
                      Container(
                        width: double.infinity,
                        height: 60,
                        margin: EdgeInsets.only(top: 10, bottom: 25),
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.shade400,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: confirmar,
                          child: Text(
                            "Confirmar todas as alterações",
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
                          Util.provedor = Provedor();
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
            fontSize: 18, fontWeight: FontWeight.bold
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
              style: TextStyle(fontSize: 16, color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  clickP = true;
                  pname.requestFocus();
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: txtEmail,
          focusNode: pname,
          readOnly: !editarP,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Email: ${Util.provedor.email_provedor}"),
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
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: txtEmail.text,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
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

  Widget buildSeguranca() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Segurança:",
          style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),
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
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: txtSenha.text,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );

    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Sua senha foi atualizado com sucesso."),
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

  Widget buildTelefone() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Telefone:",
          style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "Mudar telefone:",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  clickF = true;
                  fname.requestFocus();
                });
              },
            ),
          ],
        ),
        TextField(
          maxLength: 16,
          inputFormatters: [masktel],
          controller: txtTelefone,
          focusNode: fname,
          readOnly: !editarF,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Telefone: ${Util.provedor.telefone}"),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: showTelefone,
            child: Text(
              "Alterar Telefone",
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

  showTelefone() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content:
                  Text("Você tem certeza que deseja alterar seu Telefone?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editTelefone,
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

  editTelefone() {
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: txtTelefone.text,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );

    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Seu telefone foi atualizado com sucesso."),
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

  Widget buildEndereco() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Endereço:",
          style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "Mudar sua cidade",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  clickC = true;
                  cname.requestFocus();
                });
              },
            ),
          ],
        ),
        TextField(
          controller: txtCidade,
          focusNode: cname,
          readOnly: !editarC,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Cidade: ${Util.provedor.cidade_provedor}"),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              "Mudar seu bairro",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  clickB = true;
                  bname.requestFocus();
                });
              },
            ),
          ],
        ),
        TextField(
          controller: txtBairro,
          focusNode: bname,
          readOnly: !editarB,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Bairro: ${Util.provedor.bairro}"),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: showBairro,
            child: Text(
              "Alterar Bairro",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: showEndereco,
            child: Text(
              "Alterar Endereço",
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

  showBairro() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content: Text("Você tem certeza que deseja alterar seu Bairro?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editBairro,
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

  showEndereco() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content:
                  Text("Você tem certeza que deseja alterar seu Endereço?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editEndereco,
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

  editBairro() {
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: txtBairro.text,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Seu bairro foi atualizado com sucesso."),
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

  editEndereco() {
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: txtCidade.text,
      bairro: txtBairro.text,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Seu endereço foi atualizado com sucesso."),
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

  Widget buildServico() {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "Serviços:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Selecione os serviços que irá atualizar:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: showServicos,
              child: Text(
                "Selecione os Serviços",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: alterarServicos,
              child: Text(
                "Alterar Serviços",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  alterarServicos() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content:
                  Text("Você tem certeza que deseja alterar seus Serviços?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editServicos,
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

  editServicos() {
    String servico = "";

    if (encanador) {
      servico += "Encanador(a), ";
    }
    if (eletricista) {
      servico += "Eletricista, ";
    }
    if (faxineira) {
      servico += "Faxineiro(a), ";
    }
    if (pedreiro) {
      servico += "Pedreiro, ";
    }
    if (jardineiro) {
      servico += "Jardineiro(a), ";
    }
    if (cuidador_dog) {
      servico += "Cuidador de pet, ";
    }
    if (baba) {
      servico += "Babá, ";
    }
    if (pintor) {
      servico += "Pintor(a), ";
    }
    if (servente_pedreiro) {
      servico += "Servente de pedreiro, ";
    }
    if (cuidador_idoso) {
      servico += "Cuidador de idoso, ";
    }

    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Seus serviços foram atualizados com sucesso."),
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

  showServicos() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Selecione os seus Serviços"),
              content: Text(
                  "Selecione os serviços que deseja adicionar e manter em seu perfil."),
              actions: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Encanador",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: encanador,
                                  value: encanador,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      encanador = value!;
                                      print("Checkbox1 state: $encanador");
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 155,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Faxineira(o)",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: faxineira,
                                  value: faxineira,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      faxineira = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Pintor",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: pintor,
                                  value: pintor,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      pintor = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Cuidador de Idosos",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: cuidador_idoso,
                                  value: cuidador_idoso,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      cuidador_idoso = value!;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 150,
                              child: CheckboxListTile(
                                  title: Text(
                                    "Servente de pedreiro",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  autofocus: false,
                                  checkColor: Colors.green,
                                  selected: servente_pedreiro,
                                  value: servente_pedreiro,
                                  onChanged: (bool? value) {
                                    Navigator.pop(context);
                                    showServicos();
                                    setState(() {
                                      servente_pedreiro = value!;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        Column(children: [
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Eletricista",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: eletricista,
                                value: eletricista,
                                onChanged: (bool? value) {
                                  Navigator.pop(context);
                                  showServicos();
                                  setState(() {
                                    eletricista = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Babá",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: baba,
                                value: baba,
                                onChanged: (bool? value) {
                                  Navigator.pop(context);
                                  showServicos();
                                  setState(() {
                                    baba = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Cuidador de pet",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: cuidador_dog,
                                value: cuidador_dog,
                                onChanged: (bool? value) {
                                  Navigator.pop(context);
                                  showServicos();
                                  setState(() {
                                    cuidador_dog = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Pedreiro",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: pedreiro,
                                value: pedreiro,
                                onChanged: (bool? value) {
                                  Navigator.pop(context);
                                  showServicos();
                                  setState(() {
                                    pedreiro = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 150,
                            child: CheckboxListTile(
                                title: Text(
                                  "Jardineiro",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                autofocus: false,
                                checkColor: Colors.green,
                                selected: jardineiro,
                                value: jardineiro,
                                onChanged: (bool? value) {
                                  Navigator.pop(context);
                                  showServicos();
                                  setState(() {
                                    jardineiro = value!;
                                  });
                                }),
                          ),
                        ]),
                      ]),
                ),
                TextButton(
                    child: Text("Pronto"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        });
  }

  Widget buildDescricao() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Descrição:",
          style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            LimitedBox(
              maxWidth: 208,
              child: Text(
                "Mude a descrição dos seus serviços",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Icons.edit_rounded),
              onPressed: () {
                setState(() {
                  clickD = true;
                  dname.requestFocus();
                });
              },
            ),
          ],
        ),
        TextField(
          controller: txtDescricao,
          focusNode: dname,
          readOnly: !editarD,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: showDescricao,
            child: Text(
              "Alterar Descrição",
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

  showDescricao() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content:
                  Text("Você tem certeza que deseja alterar sua Descrição?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editDescricao,
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

  editDescricao() {
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: Util.provedor.servico,
      descricao: txtDescricao.text,
      preco: Util.provedor.preco,
      data_hora: Util.provedor.data_hora,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text("Sua descrição foi atualizado com sucesso."),
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

  Widget buildPreco() {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "Preço",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "Mude o preço dos seus serviços:",
              style: TextStyle(fontSize: 16 ),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 220,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              value: preco,
              onChanged: (String? value) {
                setState(() {
                  preco = value!;
                });
              },
              items: listPreco.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  alignment: Alignment.center,
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: showPreco,
              child: Text(
                "Alterar Preço",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showPreco() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content: Text(
                  "Você tem certeza que deseja alterar sua Faixa de Preço?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editPreco,
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

  editPreco() {
    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: preco,
      data_hora: Util.provedor.data_hora,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content:
                      Text("Sua faixa de preço foi atualizado com sucesso."),
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

  Widget buildHora() {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              "Horário:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Mude seu horarário de atendimento:",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 85,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      tratadoAM(
                          timeAM!.hour.toString(), timeAM!.minute.toString()),
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                      child: Icon(
                        Icons.access_time_outlined,
                      ),
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: timeAM!,
                        );
                        if (newTime != null) {
                          setState(() {
                            timeAM = newTime;
                          });
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "até",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      tratadoAM(
                          timePM!.hour.toString(), timePM!.minute.toString()),
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                      child: Icon(
                        Icons.access_time_outlined,
                      ),
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: timePM!,
                        );
                        if (newTime != null) {
                          setState(() {
                            timePM = newTime;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: showHora,
              child: Text(
                "Alterar Horário",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showHora() {
    showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
              title: Text("Aviso"),
              content: Text(
                  "Você tem certeza que deseja alterar seu Horário de Atendimento?"),
              actions: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: Text("Tenho"),
                      onPressed: editHora,
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

  editHora() {
    var horario = timeAM!.hour.toString() +
        ":" +
        tratarCampo(timeAM!.minute.toString()) +
        " até " +
        timePM!.hour.toString() +
        ":" +
        tratarCampo(timePM!.minute.toString());

    var provedor = Provedor(
      cod_provedor: Util.provedor.cod_provedor,
      nome_provedor: Util.provedor.nome_provedor,
      email_provedor: Util.provedor.email_provedor,
      senha_provedor: Util.provedor.senha_provedor,
      cpf_provedor: Util.provedor.cpf_provedor,
      telefone: Util.provedor.telefone,
      cidade_provedor: Util.provedor.cidade_provedor,
      bairro: Util.provedor.bairro,
      servico: Util.provedor.servico,
      descricao: Util.provedor.descricao,
      preco: Util.provedor.preco,
      data_hora: horario,
    );
    ProvedorServices provedorServices = ProvedorServices();

    provedorServices.AtualizarProvedor(provedor).then((value) {
      if (value != null) {
        Navigator.pop(this.context);
        Navigator.push(
            this.context, MaterialPageRoute(builder: (context) => TelaLogin()));
        showDialog(
            context: this.context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Concluído"),
                  content: Text(
                      "Seu horário de atendimento foi atualizado com sucesso."),
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
