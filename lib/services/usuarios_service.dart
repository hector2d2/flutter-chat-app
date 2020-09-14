import 'package:http/http.dart' as http;

import 'package:chatApp/models/usuarios_respones.dart';
import 'package:chatApp/global/enviroment.dart';
import 'package:chatApp/services/auth_services.dart';
import 'package:chatApp/models/user.dart';

class UsuarioService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken(),
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
