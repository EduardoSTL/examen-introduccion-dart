abstract class Departamento{
  void printDept(){
  }
}

mixin Dept on Departamento{
  // ignore: prefer_typing_uninitialized_variables
  var departamento;
  void printDepartamento() {
    print(departamento);
  }
}

enum Categoria{celulares, limpieza, hombre}

class Articulos extends Departamento with Dept{
  String nombre; 
  final Categoria categoria;

  @override
  var departamento;

  Articulos({
    required this.nombre,
    required this.categoria,
    required this.departamento
  })

  @override
  String toString(){
    final Categoria = categoria.toString().split('.').last;
    return 'Nombre: $nombre, Categoria: $Categoria';
  }

  factory Articulos.create({
    required String nombre,
    required Categoria categoria,
  }) {
    return Articulos(
      nombre: nombre,
      categoria: categoria,
    );
  }
}
