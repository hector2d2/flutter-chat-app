import 'package:chatApp/models/mensajes_response.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:chatApp/services/auth_services.dart';
import 'package:chatApp/global/enviroment.dart';
import 'package:chatApp/models/user.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async{
    final resp = await http.get('${Environment.apiUrl}/mensajes/$usuarioID',
    headers: {
      'Content-Type': 'application/json',
      'x-token': await AuthService.getToken(),
    });

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;

  }
}
