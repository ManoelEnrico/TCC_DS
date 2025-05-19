import 'dart:convert';
import 'package:tcc_servicos/Models/provedor.dart';
import 'package:tcc_servicos/Models/favoritos.dart';

import '../Models/consumidor.dart';
import 'package:http/http.dart' as http;
import '../Utils/utils.dart';

class ConsumidorServices {
  late List<Consumidor> consumidor;
  late List<Favoritos> favoritos;

  Future<List<Consumidor>?> getConsumidor() async {
    var response = await http.get(Uri.parse('${Util.URL}consumidor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        consumidor = (json.decode(response.body) as List)
            .map((i) => Consumidor.fromJson(i))
            .toList();
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return consumidor;
    } else {
      return null;
    }
  }

  Future<List<Consumidor>?> getConsumidorbyName(String nome) async {
    var response = await http.get(
        Uri.parse('${Util.URL}Consumidor/GetConsumidorsbyName/${nome}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        consumidor = (json.decode(response.body) as List)
            .map((i) => Consumidor.fromJson(i))
            .toList();
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return consumidor;
    } else {
      return null;
    }
  }

  Future<List<Consumidor>?> getConsumidorbyLogin(
      String email, String senha) async {
    var response = await http.get(
        Uri.parse(
            '${Util.URL}Consumidor/GetConsumidorByLogin/${email}/${senha}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        consumidor = (json.decode(response.body) as List)
            .map((i) => Consumidor.fromJson(i))
            .toList();

        if (consumidor.length == 0) return null;
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return consumidor;
    } else {
      return null;
    }
  }

  late List<Provedor> provedor;

  Future<List<Provedor>?> getFavoritosByConsumidor(int? id) async {
    var response = await http.get(
        Uri.parse('${Util.URL}Favoritos/GetFavoritosByConsumidor/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        provedor = (json.decode(response.body) as List)
            .map((i) => Provedor.fromJson(i))
            .toList();

        if (provedor.length == 0) return null;
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return provedor;
    } else {
      return null;
    }
  }

Future<List<Favoritos>?> getFavoritosAtualizados(int? id) async {
    var response = await http.get(
        Uri.parse('${Util.URL}Favoritos/GetFavoritosAtualizados/${id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        favoritos = (json.decode(response.body) as List)
            .map((i) => Favoritos.fromJson(i))
            .toList();

        if (favoritos.length == 0) return null;
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return favoritos;
    } else {
      return null;
    }
  }

  Future<bool?> IncluirConsumidor(Consumidor t) async {
    var response = await http.post(
      Uri.parse('${Util.URL}consumidor'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(t.toJson()),
    );
    if (response.statusCode == 201) { 
      // consumidor = (json.decode(response.body) as List)
      //     .map((i) => Consumidor.fromJson(i))
      //     .toList();
      // return consumidor;
      return true;
    } else {
      //return null;
      return false;
    }
  }

  Future<bool?> IncluirFavorito(Favoritos t) async {
    var response = await http.post(
      Uri.parse('${Util.URL}Favoritos/PostFavoritosByConsumidor/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(t.toJson()),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> AtualizarConsumidor(Consumidor t) async {
    var response = await http.put(
      Uri.parse('${Util.URL}consumidor/${t.cod_consumidor}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(t.toJson()),
    );

    if (response.statusCode == 204) {
      return true;
    } else
      return false;
  }

  Future<bool> RemoverConsumidor(Consumidor t) async {
    var response = await http.delete(
      Uri.parse('${Util.URL}consumidor/${t.cod_consumidor}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
