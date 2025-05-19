import 'package:flutter/material.dart';
import 'package:tcc_servicos/screens/cadastroConsumidor.dart';
import 'package:tcc_servicos/screens/telaLogin.dart';
import 'cadastroProvedor.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  provedor() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaProvedor()),
    );
  }

  consumidor() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaConsumidor()),
    );
  }

  login() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      /*appBar: AppBar(
        title: Text("Tela Inicial"),
      ),*/
      body: Container(
        margin: EdgeInsets.only(top: 85, left: 30, right: 30, bottom: 85),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.fromBorderSide(
              BorderSide(
                  width: 1.5,
                  color: Colors.black,
                  style: BorderStyle.solid), //BorderSide
            ),
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
                height: 60,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: Text(
                  "Você entrará como um provedor de serviço ou como consumidor?",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Image(
                image: AssetImage('images/Mala.png'),
                width: 65,
                height: 65,
              ),
              Container(
                width: 500,
                height: 50,
                margin:
                    EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF00c6aa),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
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
                  child: Center(
                    child: Text(
                      "Provedor",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: provedor,
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Image(
                image: AssetImage('images/comsumidor.png'),
                width: 80,
                height: 80,
              ),
              Container(
                width: 500,
                height: 50,
                margin:
                    EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFc90469),
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
                  child: Center(
                    child: Text(
                      "Consumidor",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: consumidor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
