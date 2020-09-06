import 'package:flutter/material.dart';

import 'package:chatApp/pages/chat.dart';
import 'package:chatApp/pages/loading.dart';
import 'package:chatApp/pages/login.dart';
import 'package:chatApp/pages/register.dart';
import 'package:chatApp/pages/usuarios.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios' : (_) => UsuariosPage(),
  'chat'     : (_) => ChatPage(),
  'login'    : (_) => LoginPage(),
  'register' : (_) => RegisterPage(),
  'loading'  : (_) => LoadingPage(),
};