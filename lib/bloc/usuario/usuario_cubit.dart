library usuario_cubit;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados_app/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  // Cuando se llame al constructor se llama al usuarioInitial que es el estado inicial,
  //que tiene la propieda existeUsuario a falso

  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int nuevaEdad) {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      // El copyWith hace la copia del estado anterior para regresar uno nuevo, no se muta el anterior.
      final newUser = currentState.usuario.copyWith(edad: 30);
      emit(UsuarioActivo(newUser));
    }
  }

  void addProfesion() {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final nuevasProfesiones = [
        ...currentState.usuario.profesiones!,
        'Profesión ${currentState.usuario.profesiones!.length + 1}'
      ];

      final newUser = currentState.usuario.copyWith(profesiones: nuevasProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
