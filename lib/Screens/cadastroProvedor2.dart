// ignore_for_file: unused_import, unnecessary_null_comparison
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Screens/home.dart';
import 'package:tcc_servicos/Screens/telaLogin.dart';
import 'package:tcc_servicos/Services/provedor_services.dart';
import 'package:tcc_servicos/Utils/utils.dart';

class CadastroProvedor2 extends StatefulWidget {
  final Provedor prov;

  CadastroProvedor2({required this.prov});

  @override
  _CadastroProvedor2State createState() => _CadastroProvedor2State();
}

class _CadastroProvedor2State extends State<CadastroProvedor2> {
  var cont = 0;

  var descreva = TextEditingController();

  login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaLogin()));
  }

  cadastro() {
    String servicos = "";

    if (encanador) {
      servicos += "Encanador(a), ";
    }
    if (eletricista) {
      servicos += "Eletricista, ";
    }
    if (faxineira) {
      servicos += "Faxineiro(a), ";
    }
    if (pedreiro) {
      servicos += "Pedreiro, ";
    }
    if (jardineiro) {
      servicos += "Jardineiro(a), ";
    }
    if (cuidador_dog) {
      servicos += "Cuidador de pet, ";
    }
    if (baba) {
      servicos += "Babá, ";
    }
    if (pintor) {
      servicos += "Pintor(a), ";
    }
    if (servente_pedreiro) {
      servicos += "Servente de pedreiro, ";
    }
    if (cuidador_idoso) {
      servicos += "Cuidador de idoso, ";
    }

    var horario = timeAM!.hour.toString() +
        ":" +
        tratarCampo(timeAM!.minute.toString()) +
        " até " +
        timePM!.hour.toString() +
        ":" +
        tratarCampo(timePM!.minute.toString());

    //var selecionados = servico.split(",");

    var provedor = Provedor(
      cod_provedor: widget.prov.cod_provedor,
      nome_provedor: widget.prov.nome_provedor,
      email_provedor: widget.prov.email_provedor,
      senha_provedor: widget.prov.senha_provedor,
      cpf_provedor: widget.prov.cpf_provedor,
      telefone: widget.prov.telefone,
      cidade_provedor: widget.prov.cidade_provedor,
      bairro: widget.prov.bairro,
      servico: servicos,
      descricao: descreva.text,
      preco: preco,
      data_hora: horario,
    );

    ProvedorServices provedorServices = ProvedorServices();

    if (cont == 1) {
      if (servicos != "" ||
          descreva.text != "" ||
          preco != "" ||
          horario != "") {
        print("nao estou laa");
        provedorServices.AtualizarProvedor(provedor).then((value) {
          if (value != null) {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => TelaLogin()));
          }
        });
      } else {
        print("Estou aquiiii");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: Text("Erro"),
                  content: Text("Todos os campos precisam ser preenchidos."),
                  actions: <Widget>[
                    TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        })
                  ]);
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: Text("Erro"),
                content: Text("Aceite os nossos termos e condições"),
                actions: <Widget>[
                  TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ]);
          });
    }
  }
  //termina o cadastro

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

  TimeOfDay? timeAM = TimeOfDay(hour: 6, minute: 00);
  TimeOfDay? timePM = TimeOfDay(hour: 18, minute: 00);

  @override
  void initState() {
    preco = listPreco.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      /*appBar: AppBar(
        title: Text("Cadastro Consumidor"),
      ),*/
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        // color: Colors.blueGrey,//
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
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(children: [
                  Text(
                    "Quais suas áreas de atuação?: ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                                    checkColor: Colors.white,
                                    selected: encanador,
                                    value: encanador,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        encanador = value!;
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
                                    checkColor: Colors.white,
                                    selected: faxineira,
                                    value: faxineira,
                                    onChanged: (bool? value) {
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
                                    checkColor: Colors.white,
                                    selected: pintor,
                                    value: pintor,
                                    onChanged: (bool? value) {
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
                                    checkColor: Colors.white,
                                    selected: cuidador_idoso,
                                    value: cuidador_idoso,
                                    onChanged: (bool? value) {
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
                                    checkColor: Colors.white,
                                    selected: servente_pedreiro,
                                    value: servente_pedreiro,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        servente_pedreiro = value!;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          /*SizedBox(
                            width: 15,
                          ),*/
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
                                  checkColor: Colors.white,
                                  selected: eletricista,
                                  value: eletricista,
                                  onChanged: (bool? value) {
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
                                  checkColor: Colors.white,
                                  selected: baba,
                                  value: baba,
                                  onChanged: (bool? value) {
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
                                  checkColor: Colors.white,
                                  selected: cuidador_dog,
                                  value: cuidador_dog,
                                  onChanged: (bool? value) {
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
                                  checkColor: Colors.white,
                                  selected: pedreiro,
                                  value: pedreiro,
                                  onChanged: (bool? value) {
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
                                  checkColor: Colors.white,
                                  selected: jardineiro,
                                  value: jardineiro,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      jardineiro = value!;
                                    });
                                  }),
                            ),
                          ]),
                        ]),
                  ),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                    ),
                    label: Text("Descreva como você realiza o seu serviço:"),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  controller: descreva,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Qual a sua faixa de preço?",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 220,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.fromBorderSide(
                    BorderSide(
                        width: 1.5,
                        color: Colors.black,
                        style: BorderStyle.solid), //BorderSide
                  ),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: preco,
                  onChanged: (String? value) {
                    setState(() {
                      preco = value!;
                    });
                  },
                  items:
                      listPreco.map<DropdownMenuItem<String>>((String value) {
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
              SizedBox(
                height: 25,
              ),
              Text(
                "Nos fale o seu horario de atendimento:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
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
                          tratadoAM(timeAM!.hour.toString(),
                              timeAM!.minute.toString()),
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
                          tratadoAM(timePM!.hour.toString(),
                              timePM!.minute.toString()),
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
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  termosCondicoes();
                },
                child: Text(
                  "Leia os termos e condições.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 500,
                height: 50,
                margin:
                    EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF00c6aa),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(width: 1, color: Colors.black),
                    ),
                  )),
                  child: Text(
                    "Cadastrar Provedor",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: cadastro,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text("Já é usuário? Clique "),
                      ),
                      GestureDetector(
                        onTap: login,
                        child: /*Container(
                          child:*/
                            Text(
                          "aqui.",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      // ),
                    ]),
              ),
              SizedBox(
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  termosCondicoes() {
    double tamanho = 15;
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Termos e Condições - Vixe Precisou Chamou."),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aceitação dos Termos e Condições:',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'Ao utilizar o aplicativo "Vixe Precisou Chamou" (doravante denominado "VixiServ"), o usuário concorda integralmente com os Termos e Condições aqui estabelecidos, em conformidade com o Código Civil Brasileiro, artigo 421./;',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Cadastro e Responsabilidade da Conta:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'O usuário é responsável por manter a confidencialidade de suas informações de conta, conforme previsto no Marco Civil da Internet (Lei nº 12.965/2014, artigo 7º, VII). O fornecimento de dados falsos ou utilização de informações de terceiros constitui violação dos termos e está sujeito às penalidades previstas no Código Penal Brasileiro, artigo 171;',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Conformidade com as Leis Brasileiras:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'O usuário compromete-se a utilizar o Aplicativo em conformidade com todas as leis e regulamentações brasileiras aplicáveis, incluindo o Marco Civil da Internet (Lei nº 12.965/2014), sob pena de responsabilização nos termos do Código Civil Brasileiro, artigos 186 e 927;',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Propriedade Intelectual:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'Todos os direitos de propriedade intelectual relacionados ao Aplicativo são exclusivos da Vixe Precisou Chamou, protegidos pela Lei de Direitos Autorais (Lei nº 9.610/1998). Qualquer violação destes direitos estará sujeita às sanções previstas pela legislação brasileira, conforme artigo 102 da referida lei;',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Conteúdo do Usuário e Licença de Uso:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'Ao enviar conteúdo para o Aplicativo, o usuário concede à Vixe Precisou Chamou uma licença irrestrita, não exclusiva e gratuita, em conformidade com o Marco Civil da Internet (Lei nº 12.965/2014, artigo 7º, II);',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Limitação de Responsabilidade:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'A Vixe Precisou Chamou não se responsabiliza por danos diretos, indiretos, incidentais ou consequentes decorrentes do uso do Aplicativo, observando os limites estabelecidos pelo Código de Defesa do Consumidor (Lei nº 8.078/1990, artigo 14);',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Alterações nos Termos:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'Reservamo-nos o direito de modificar estes Termos a qualquer momento, garantindo a transparência e a proteção do consumidor, conforme estabelecido no Código de Defesa do Consumidor (Lei nº 8.078/1990, artigo 6º, III);',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Encerramento da Conta:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'A Vixe Precisou Chamou reserva-se o direito de encerrar ou suspender contas de usuários a seu critério, seguindo as normativas do Código Civil Brasileiro (artigo 473) e respeitando o contraditório e ampla defesa assegurados pela Constituição Federal (artigo 5º, LV);',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Lei Aplicável e Jurisdição:',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        Text(
                          'Estes Termos e Condições são regidos pelas leis brasileiras, com jurisdição exclusiva dos tribunais competentes da Comarca de Adamantina, São Paulo, de acordo com o Código de Processo Civil (Lei nº 13.105/2015, artigo 46);',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ao utilizar o Aplicativo, o usuário reconhece e concorda expressamente com estes Termos e Condições, em conformidade com a legislação brasileira. Em caso de dúvidas ou esclarecimentos adicionais, recomendamos entrar em contato conosco.',
                          style: TextStyle(
                            fontSize: tamanho,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                            child: Text("Não aceito."),
                            onPressed: () {
                              Navigator.pop(context);
                              cont = 0;
                            }),
                        SizedBox(
                          width: 50,
                        ),
                        TextButton(
                            child: Text("Li e aceito."),
                            onPressed: () {
                              Navigator.pop(context);
                              cont = 1;
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  child: SingleChildScrollView(),
                ),
              ]);
        });
  }
}
