import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: (usuarioService.existeUsuario) ? Text(usuarioService.usuario.nombre) : Text('Pagina 2'),
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
                final nuevoUsuario =
                    new Usuario(nombre: 'Fran', edad: 34, profesiones: ['FullStack Developer', 'Fotógrafo']);
                usuarioService.usuario = nuevoUsuario;
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[400],
              onPressed: () => usuarioService.cambiarEdad(30),
            ),
            MaterialButton(
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue[400],
              onPressed: () => usuarioService.agregarProfesion(),
            ),
          ],
        ),
      ),
    );
  }
}
