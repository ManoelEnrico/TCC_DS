// ignore_for_file: unused_import
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Screens/cadastroProvedor2.dart';
import 'package:tcc_servicos/screens/telaLogin.dart';
import '../Services/provedor_services.dart';
import '../Utils/utils.dart';

class TelaProvedor extends StatefulWidget {
  @override
  _TelaProvedorState createState() => _TelaProvedorState();
}

class _TelaProvedorState extends State<TelaProvedor> {
  var email_provedor = TextEditingController(); //
  var nome_provedor = TextEditingController(); //
  var senha_provedor = TextEditingController(); //
  var confirmarSenha = TextEditingController();
  var cidade_provedor = TextEditingController(); //
  var cpf_provedor = TextEditingController(); //
  var telefone = TextEditingController();
  var bairro = TextEditingController(); //
  var servico = TextEditingController();
  var descricao = TextEditingController();
  var preco = TextEditingController();
  var data_hora = TextEditingController();
  var maskcpf = MaskTextInputFormatter(mask: '###.###.###-##');
  var masktel = MaskTextInputFormatter(mask: ' (##) #####-####');

  cadastrar() {
    var provedor = Provedor(
      email_provedor: email_provedor.text,
      nome_provedor: nome_provedor.text,
      senha_provedor: senha_provedor.text,
      cpf_provedor: cpf_provedor.text,
      telefone: telefone.text,
      cidade_provedor: cidade_provedor.text,
      bairro: bairro.text,
      servico: "Serviço temporário",
      descricao: "Descrição temporária",
      preco: "R\$Temp",
      data_hora: "12:00 até 12:00",
    );
    ProvedorServices provedorServices = ProvedorServices();

    if (confirmarSenha.text == senha_provedor.text) {
      provedorServices.IncluirProvedor(provedor).then((value) {
        if (value != null) {
          provedor.cod_provedor = value.cod_provedor;

          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CadastroProvedor2(prov: provedor)));
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
      });
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
  }

  login() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TelaLogin()));
  }

  bool showPassword = false;

  bool termos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa3b7eb),
      /*appBar: AppBar(
        title: Text("Cadastro Provedor"),
      ),*/
      body: Container(
        margin: EdgeInsets.all(30),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFa3b7eb),
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
                  controller: email_provedor,
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
                    label: Text("Nome completo:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: nome_provedor,
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
                  obscureText: showPassword == false ? true : false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 3,
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(Icons.key),
                    label: Text("Senha:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: senha_provedor,
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
                  autofocus: true,
                  maxLength: 14,
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
                  controller: cpf_provedor,
                  inputFormatters: [maskcpf],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 45,
                ),
                child: TextField(
                  maxLength: 16,
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
                    label: Text("Telefone:"),
                    hintText: "Ex: (18)99712-3456",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: telefone,
                  inputFormatters: [masktel],
                ),
              ),
              SizedBox(
                height: 10,
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
                    label: Text("Cidade:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: cidade_provedor,
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
                    label: Text("Bairro:"),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  controller: bairro,
                ),
              ),
              SizedBox(
                height: 30,
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
                    ),
                  ),
                  child: Text(
                    "Próxima Etapa",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: cadastrar,
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
                              color: Colors.blue,
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
}
