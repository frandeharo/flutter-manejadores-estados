import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/models/usuario.dart';

import 'package:estados_app/bloc/usuario/usuario_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establecer usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[400],
              onPressed: () {
                final newUser = new Usuario(nombre: 'Fran', edad: 34, profesiones: ['FullStack Developer']);

                usuarioBloc.add(ActivarUsuario(newUser));
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[400],
              onPressed: () {
                usuarioBloc.add(CambiarEdad(30));
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[400],
              onPressed: () {
                usuarioBloc.add(AgregarProfesion('Nuevo curro'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
