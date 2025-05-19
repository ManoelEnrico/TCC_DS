// ignore_for_file: unused_import

import 'package:camera/camera.dart';
import 'package:tcc_servicos/Models/favoritos.dart';
import 'package:tcc_servicos/Models/provedor.dart';
import '../Models/consumidor.dart';

class Util{

  static const URL = 'http://10.0.2.2:5717/api/';

  static late final firstCamera;
  static late XFile image; 

  static bool foto_atualizada = false;


  static late Consumidor consumidor;
  static late Provedor provedor;
  static late Favoritos favoritos;

  static int tipo = 0;
}