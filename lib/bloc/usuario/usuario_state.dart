part of 'usuario_bloc.dart';

class UsuarioState {
  final bool existeUsuario;
  final Usuario? usuario;

  UsuarioState({
    Usuario? user,
  })  : usuario = user ?? null,
        existeUsuario = (user != null) ? true : false;

  // Método que devuelve un usuarioState
  UsuarioState copyWith({Usuario? usuario}) => UsuarioState(user: usuario ?? this.usuario);

  // El estado inicial indica el punto inicial de la app o del usuario, se pueden agregar propiedades, como se inicializará
  UsuarioState estadoInicial() => new UsuarioState();
}
