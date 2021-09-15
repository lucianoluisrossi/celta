import 'package:celta/widgets/authentication/show_dialog.dart';
import 'package:celta/widgets/authentication/auth_button.dart';
import 'package:celta/widgets/authentication/auth_text_field.dart';

import 'package:flutter/material.dart';

class RegisterFirebaseAuthForm extends StatefulWidget {
  const RegisterFirebaseAuthForm(
      {this.alignmentForm,
      this.formHeight,
      this.formWidth,
      required this.email,
      required this.registerAccount,
      required this.cancel,
      required this.emailVerified});

//Propiedades de layout
  final AlignmentGeometry? alignmentForm;
  final double? formWidth;
  final double? formHeight;

//Propiedades de Auth
  final String email;
  final void Function(String email, String password) registerAccount;
  final void Function() emailVerified;
  final void Function()? cancel;

  @override
  _RegisterFirebaseAuthFormState createState() =>
      _RegisterFirebaseAuthFormState();
}

class _RegisterFirebaseAuthFormState extends State<RegisterFirebaseAuthForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = widget.email;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: widget.alignmentForm,
        width: widget.formWidth,
        height: widget.formHeight,
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        decoration: BoxDecoration(
          //backgroundBlendMode: BlendMode.clear,
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 10.0, offset: Offset(0.0, 5.0))
          ],
        ),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Nuevo Usuario',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Usted no esta registrado, verifique su email e ingrese una clave para completar su registro.',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              AuthTextField(
                fieldIcon: Icons.mail,
                hint: 'Ingrese un Email válido',
                label: 'Email',
                textColor: Colors.green,
                hideText: false,
                textController: _emailController,
                inputType: TextInputType.emailAddress,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese su email para continuar';
                  }
                  return null;
                },
              ),
              AuthTextField(
                fieldIcon: Icons.password,
                hint: 'Ingrese una Contraseña',
                label: 'Contraseña',
                textColor: Colors.green,
                hideText: true,
                textController: _passwordController,
                inputType: TextInputType.visiblePassword,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese una contraseña válida';
                  }
                  return null;
                },
              ),
              AuthButton(
                  label: 'Registrar',
                  onPressed: () {
                    widget.registerAccount(
                        _emailController.text, _passwordController.text);
                  }),
              MaterialButton(
                onPressed: widget.cancel,
                child: Text('Cancelar Registro'),
              )
            ],
          ),
        ),
      ),
    );
  }
}