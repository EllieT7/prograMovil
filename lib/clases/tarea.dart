class Tarea{
  final int cod_tarea;
  final String descripcion;
  final String fecha_inicio;
  final String fecha_final;
  final int terminada;


  Tarea({required this.cod_tarea, required this.descripcion, required this.fecha_inicio, required this.fecha_final,
      required this.terminada});

  Map<String, dynamic> toMap() {
    return {
      'descripcion': descripcion,
      'fecha_inicio': fecha_inicio,
      'fecha_final': fecha_final,
      'terminada': terminada
    };
  }

  // Implementa toString para que sea más fácil ver información sobre cada perro
  // usando la declaración de impresión.
  @override
  String toString() {
    return 'Tarea{id: $cod_tarea, desc: $descripcion, inicio: $fecha_inicio, final: $fecha_final, terminada: $terminada}';
  }

}