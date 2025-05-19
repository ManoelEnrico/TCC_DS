import 'dart:convert';
import '../Models/provedor.dart';
import 'package:http/http.dart' as http;
import '../Utils/utils.dart';

class ProvedorServices {
  late List<Provedor> provedor;

  Future<List<Provedor>?> getProvedor() async {
    var response = await http.get(Uri.parse('${Util.URL}provedor'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        provedor = (json.decode(response.body) as List)
            .map((i) => Provedor.fromJson(i))
            .toList();
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return provedor;
    } else {
      return null;
    }
  }

//Procura pelo serviço do provedor
  Future<List<Provedor>?> getProvedorbyName(String servico) async {
    var response = await http.get(
        Uri.parse('${Util.URL}Provedor/GetProvedorByName/${servico}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        provedor = (json.decode(response.body) as List)
            .map((i) => Provedor.fromJson(i))
            .toList();
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return provedor;
    } else {
      return null;
    }
  }

  Future<List<Provedor>?> getProvedorbyServico(String servico) async {
    var response = await http.get(
        Uri.parse('${Util.URL}Provedor/GetProvedorByServico/${servico}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=utf-8'
        });

    if (response.statusCode == 200) {
      try {
        provedor = (json.decode(response.body) as List)
            .map((i) => Provedor.fromJson(i))
            .toList();
      } catch (exception) {
        print(exception.toString());
        return null;
      }
      return provedor;
    } else {
      return null;
    }
  }

  Future<List<Provedor>?> getProvedorbyLogin(String email, String senha) async {
    var response = await http.get(
        Uri.parse('${Util.URL}Provedor/GetProvedorByLogin/${email}/${senha}'),
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

  Future<Provedor?> IncluirProvedor(Provedor t) async {
    var response = await http.post(
      Uri.parse('${Util.URL}provedor'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(t.toJson()),
    );

    if (response.statusCode == 201) {
      print(response.body);

      Provedor p = Provedor.fromJson(json.decode(response.body));

      // provedor = (json.decode(response.body) as List)
      //     .map((i) => Provedor.fromJson(i))
      //     .toList();

      // return provedor;
      return p;
    } else {
      //return false;
      return null;
    }
  }

  Future<bool> AtualizarProvedor(Provedor t) async {
    var response = await http.put(
      Uri.parse('${Util.URL}provedor/${t.cod_provedor}'),
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

  Future<bool> RemoverProvedor(Provedor t) async {
    var response = await http.delete(
      Uri.parse('${Util.URL}provedor/${t.cod_provedor}'),
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
