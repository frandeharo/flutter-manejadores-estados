class Usuario {
  final String nombre;
  final int edad;
  final List<String>? profesiones;

  Usuario({required this.nombre, required this.edad, this.profesiones});

  // Método que copia el usuario
  // Si no tiene valor se coge el que tiene la clase
  Usuario copyWith({String? nombre, int? edad, List<String>? profesiones}) =>
      new Usuario(nombre: nombre ?? this.nombre, edad: edad ?? this.edad, profesiones: profesiones ?? this.profesiones);
}
