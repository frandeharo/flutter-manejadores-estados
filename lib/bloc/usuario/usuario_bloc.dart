import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:estados_app/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  // EL yield para retornar sólo funciona con una funcion generadora de ahí el async*, devuelve un stream no un FUture
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(usuario: state.usuario!.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      yield state.copyWith(
          usuario: state.usuario!.copyWith(profesiones: [...state.usuario!.profesiones!, event.profesion]));
    } else if (event is BorrarUsuario) {
      yield state.estadoInicial();
    }
  }
}
