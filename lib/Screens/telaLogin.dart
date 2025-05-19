import 'package:flutter/material.dart';
import 'package:tcc_servicos/Screens/home.dart';
import 'package:tcc_servicos/Utils/utils.dart';
import 'package:tcc_servicos/screens/telaInicial.dart';
import '../Services/consumidor_services.dart';
import '../Services/provedor_services.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

enum Escolher { p, c }

class _TelaLoginState extends State<TelaLogin> {
  var email = TextEditingController();
  var senha = TextEditingController();

  Escolher? tipo;

  @override
  initState() {
    super.initState();
    tipo = Escolher.p;
  }

  tela() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaInicial()),
    );
  }

  entar() async {
    if (tipo == Escolher.c) {
      ConsumidorServices consumidorServices = ConsumidorServices();

      await consumidorServices
          .getConsumidorbyLogin(email.text, senha.text)
          .then((value) {
        if (email.text.isNotEmpty && senha.text.isNotEmpty) {
          if (value != null) {
            Util.consumidor = value.first;
            Util.tipo = 1;

            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Example()));
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text("Erro"),
                      content: Text("Login e/ou Senha inválido(s)"),
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
                    content: Text("Login e/ou Senha inválido(s)"),
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
    } else {
      ProvedorServices provedorServices = ProvedorServices();

      await provedorServices
          .getProvedorbyLogin(email.text, senha.text)
          .then((value) {
        if (email.text.isNotEmpty && senha.text.isNotEmpty) {
          if (value != null) {
            Util.provedor = value.first;
            Util.tipo = 0;

            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Example()));
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text("Erro"),
                      content: Text("Login e/ou Senha inválido(s)"),
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
                    content: Text("Login e/ou Senha inválido(s)"),
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
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      body: buildPagina(),
    );
  }

  Widget buildPagina() {
    return Container(
      margin: EdgeInsets.only(top: 85, left: 30, right: 30, bottom: 30),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    width: 1.5,
                    color: Colors.black,
                    style: BorderStyle.solid,
                  ),
                ),
                color: Color(0xFFFEFBF9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(children: [
                SizedBox(
                  height: 80,
                ),
                buildEmail(),
                SizedBox(
                  height: 30,
                ),
                buildSenha(),
                SizedBox(
                  height: 35,
                ),
                buildTipo(),
                SizedBox(
                  height: 25,
                ),
                buildButtonE(),
                SizedBox(
                  height: 30,
                ),
                buildCadastre(),
                SizedBox(
                  height: 30,
                ),
              ]),
            ),
            Image(
              image: AssetImage('images/logo.png'),
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 45,
      ),
      child: TextField(
        controller: email,
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
            labelStyle: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget buildSenha() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 45,
      ),
      child: TextField(
        controller: senha,
        autofocus: true,
        obscureText: showPassword == false ? true : false,
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
              showPassword == false ? Icons.visibility_off : Icons.visibility,
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
      ),
    );
  }

  Widget buildTipo() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Text(
            "Você entrará como provedor ou consumidor de serviços?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   width: 130,
              //child:
              ListTile(
                title: Text("Provedor"),
                leading: Radio<Escolher>(
                  value: Escolher.p,
                  groupValue: tipo,
                  onChanged: (Escolher? value) {
                    setState(() {
                      tipo = value;
                    });
                  },
                ),
              ),
              //),
              // Container(
              //   width: 130,
              //   child:
              ListTile(
                title: Text("Consumidor"),
                leading: Radio<Escolher>(
                  value: Escolher.c,
                  groupValue: tipo,
                  onChanged: (Escolher? value) {
                    setState(() {
                      tipo = value;
                    });
                  },
                ),
              ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButtonE() {
    return Container(
      width: 500,
      height: 50,
      margin: EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
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
          ),
        ),
        child: Text(
          "Entrar",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: entar,
      ),
    );
  }

  Widget buildCadastre() {
    return SizedBox(
      width: double.infinity,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          child: Text(
            "Ainda não possui uma conta? Clique ",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        GestureDetector(
          onTap: tela,
          child: Container(
            child: Text(
              "aqui.",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.blue,
                fontWeight: FontWeight.w100,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
