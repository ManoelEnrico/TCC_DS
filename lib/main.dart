// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tcc_servicos/Models/consumidor.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Screens/cadastroConsumidor.dart';
import 'package:tcc_servicos/Screens/cadastroProvedor.dart';
import 'package:tcc_servicos/Screens/cadastroProvedor2.dart';
import 'package:tcc_servicos/Screens/configuracoes.dart';
import 'package:tcc_servicos/Screens/configuracoesP.dart';
import 'package:tcc_servicos/Screens/expandedCard.dart';
import 'package:tcc_servicos/Screens/favoritos.dart';
import 'package:tcc_servicos/Screens/home.dart';
import 'package:tcc_servicos/Screens/perfilConsumidor.dart';
import 'package:tcc_servicos/Screens/telaBusca.dart';
import 'package:tcc_servicos/Screens/telaCardExpan.dart';
import 'package:tcc_servicos/Screens/telaHome.dart';
import 'package:tcc_servicos/Screens/telaLogin.dart';
import 'package:tcc_servicos/Screens/perfilTeste.dart';
import 'package:tcc_servicos/Screens/telaSplash.dart';
import 'package:tcc_servicos/screens/telaInicial.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
