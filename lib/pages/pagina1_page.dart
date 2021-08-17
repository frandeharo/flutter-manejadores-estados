import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/models/usuario.dart';
import 'package:estados_app/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.account_tree),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        print(state);
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No existe información del usuario'));
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
          default:
            return Center(child: Text('Estado no reconocido'));
        }
        // if (state is UsuarioInitial) {
        //   return Center(child: Text('No existe información del usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return Center(child: Text('Estado no reconocido'));
        // }
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          // ListTile(title: Text('Profesion 1:')),
          ...usuario.profesiones!.map((prof) => ListTile(title: Text(prof))).toList()
        ],
      ),
    );
  }
}
