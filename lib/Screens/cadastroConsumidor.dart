// ignore_for_file: unused_import
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:path/path.dart';
import 'package:tcc_servicos/Models/consumidor.dart';
import 'package:tcc_servicos/Screens/home.dart';
import 'package:tcc_servicos/Services/consumidor_services.dart';
import 'package:tcc_servicos/screens/telaLogin.dart';

import '../Utils/utils.dart';

class TelaConsumidor extends StatefulWidget {
  @override
  _TelaConsumidorState createState() => _TelaConsumidorState();
}

class _TelaConsumidorState extends State<TelaConsumidor> {
  var cont = 0;

  login() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaLogin()));
  }

  var email_consumidor = TextEditingController();
  var nome_consumidor = TextEditingController();
  var senha_consumidor = TextEditingController();
  var confirmarSenha = TextEditingController();
  var cpf_consumidor = TextEditingController();

  var maskcpf = MaskTextInputFormatter(mask: '###.###.###-##');
  var masktel = MaskTextInputFormatter(mask: ' (##) #####-####');

  cadastrar() {
    //if (cont == 1) {
    var consumidor = Consumidor(
      email_consumidor: email_consumidor.text,
      nome_consumidor: nome_consumidor.text,
      senha_consumidor: senha_consumidor.text,
      cpf_consumidor: cpf_consumidor.text,
    );

    ConsumidorServices consumidorServices = ConsumidorServices();

    if (email_consumidor.text.isNotEmpty ||
        nome_consumidor.text.isNotEmpty ||
        senha_consumidor.text.isNotEmpty ||
        cpf_consumidor.text.isNotEmpty) {
      if (confirmarSenha.text == senha_consumidor.text) {
        if (cont == 1) {
          consumidorServices.IncluirConsumidor(consumidor).then((value) {
            if (value != null) {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaLogin()));
            }
          });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text("Erro"),
                    content: Text("Aceite os nossos termos e condições."),
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
                  content:
                      Text("A senha precisa ser a mesma nos dois os campos."),
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
  }

  bool showPassword = false;

  bool termos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  autofocus: true,
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
                    label: Text("E-mail:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: email_consumidor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  autofocus: true,
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
                    label: Text("Nome:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: nome_consumidor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  obscureText: showPassword == false ? true : false,
                  autofocus: true,
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
                    suffixIcon: GestureDetector(
                      child: Icon(
                        showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    prefixIcon: Icon(Icons.key),
                    label: Text("Senha:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: senha_consumidor,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  controller: confirmarSenha,
                  obscureText: showPassword == false ? true : false,
                  autofocus: true,
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
                    suffixIcon: GestureDetector(
                      child: Icon(
                        showPassword == false
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    prefixIcon: Icon(Icons.key),
                    label: Text("Confirme sua Senha:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  maxLength: 14,
                  autofocus: true,
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
                    label: Text("CPF:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: cpf_consumidor,
                  inputFormatters: [maskcpf],
                ),
              ),
              SizedBox(
                height: 30,
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
                  onPressed: cadastrar,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                  child: Text(
                    "Cadastrar Consumidor",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                        child: Container(
                          child: Text(
                            "aqui.",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
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
