import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chatApp/services/socket_service.dart';
import 'package:chatApp/helpers/mostrar_alerta.dart';
import 'package:chatApp/services/auth_services.dart';
import 'package:chatApp/widgets/btn_azul.dart';
import 'package:chatApp/widgets/labels.dart';
import 'package:chatApp/widgets/logo.dart';
import 'package:chatApp/widgets/custom_input.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(
                  titulo: 'Registro',
                ),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: '¿Ya tienes una cuenta?',
                  subTitulo: 'Ingresa ahora!',
                ),
                Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyBoardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPasword: true,
          ),
          BtnAzul(
            text: 'Ingrese',
            onpress: authService.autenticando
                ? null
                : () async {
                    print(nameCtrl.text.trim());
                    FocusScope.of(context).unfocus();

                    final registerOk = await authService.register(
                      nameCtrl.text.trim(),
                      emailCtrl.text.trim(),
                      passCtrl.text.trim(),
                    );

                    if (registerOk == true) {
                      socketService.Connect();
                      Navigator.pushReplacementNamed(context, 'users');
                    }else{
                      mostrarAlerta(
                        context,
                        'Registro incorrecto',
                        registerOk,
                      );

                    }
                  },
          ),
        ],
      ),
    );
  }
}
