abstract class Departamento{
  void printDept(){
  }
}

mixin Dept on Departamento{
  // ignore: prefer_typing_uninitialized_variables
  var departamento;
  List cantidadArticulos = ['1', '2', '3'];
  void printDepartamento() {
    print('Departamento: $departamento, Cantidad de articulos: $cantidadArticulos');
  }
}

enum Categoria{celulares, limpieza, hombre}

class Articulos extends Departamento with Dept{
  String nombre; 
  final Categoria categoria;
  final int cantidad;

  @override
  var departamento;
  @override
  List cantidadArticulos =['1','2', '3'];

  Articulos({
    required this.nombre,
    required this.categoria,
    required this.cantidad,
    required this.cantidadArticulos,
    required this.departamento
  });

  @override
  String toString(){
    final Categoria = categoria.toString().split('.').last;
    return 'Nombre: $nombre, Cantidad: $cantidad, Categoria: $Categoria,  Departamento: $departamento';
  }

  factory Articulos.create({
    required String nombre,
    required Categoria categoria,
    required int cantidad,
    required List cantidadArticulos,
    required String departamento,
  }) {
    return Articulos(
      nombre: nombre,
      categoria: categoria,
      cantidad: cantidad,
      cantidadArticulos: cantidadArticulos,
      departamento: departamento,
    );
  }
}

void main() {
  Articulos articulos1 = Articulos.create(nombre: 'Monitor ACER', categoria: Categoria.celulares, cantidad: 8, cantidadArticulos: List, departamento: 'Tecnologia');
  articulos1.printDepartamento(); 
  print(articulos1); 
}