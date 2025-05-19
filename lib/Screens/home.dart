// ignore_for_file: unused_import, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Screens/configuracoes.dart';
import 'package:tcc_servicos/Screens/configuracoesP.dart';
import 'package:tcc_servicos/Screens/favoritos.dart';
import 'package:tcc_servicos/Screens/perfilConsumidor.dart';
import 'package:tcc_servicos/Screens/perfilTeste.dart';
import 'package:tcc_servicos/Screens/telaBusca.dart';
import 'package:tcc_servicos/Screens/telaHome.dart';
import 'package:tcc_servicos/Utils/utils.dart';
import '../Models/consumidor.dart';

void main() => runApp(MaterialApp(
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    title: 'GNav',
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: Example()));

class Example extends StatefulWidget {
  Example({super.key});
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var x = Util.tipo;

    int x1 = 0;
  }

  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    TelaHome(),
    Util.tipo == 1 ? Favoritos() : buildText(),
    Pesquisa(),
    Util.tipo == 1
        ? PerfilConsimidor(
            consumi: Consumidor(
                nome_consumidor: Util.consumidor.nome_consumidor,
                email_consumidor: Util.consumidor.email_consumidor),
          )
        : TestePerfil(
            prov: Provedor(
                nome_provedor: Util.provedor.nome_provedor,
                email_provedor: Util.provedor.email_provedor,
                cidade_provedor: Util.provedor.cidade_provedor,
                bairro: Util.provedor.bairro,
                servico: Util.provedor.servico,
                descricao: Util.provedor.descricao,
                preco: Util.provedor.preco,
                data_hora: Util.provedor.data_hora),
          ),
    Util.tipo == 1 ? Configuracoes() : ConfiguracoesP(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF008eff),
        title: Text('Vixi Precisou Chamou'),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('Pagina Incial'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Favoritos'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);

                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Configurações'),
              selected: _selectedIndex == 2,
              //////////////////////// == 2,
              onTap: () {
                //Chamar config
                _onItemTapped(4);
                //onItemTapped(4);

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.lightBlue.shade50,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.star,
                  text: 'Favoritos',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Buscar',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Perfil',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildText() {
  return Container(
    height: double.infinity,
    color: Color(0xFFa3b7eb),
    child: Center(
      child: Text(
        "Apenas consumidores tem acesso a tela de Favoritos.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    ),
  );
}
