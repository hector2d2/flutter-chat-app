import 'dart:io';

class Environment{
  //cambiar direccion ip por http://10.0.2.2:3000
  static String apiUrl    = Platform.isAndroid ? 'http://192.168.1.100:3000/api' : 'http://localhost:3000/api';
  static String socketUrl = Platform.isAndroid ? 'http://192.168.1.100:3000'     : 'http://localhost:3000';

}