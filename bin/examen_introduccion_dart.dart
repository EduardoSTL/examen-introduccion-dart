abstract class Departamento{
  void printDept(){
  }
}

mixin Dept on Departamento{
  // ignore: prefer_typing_uninitialized_variables
  var departamento;
  List cantidadArticulos = [];
  void printDepartamento() {
    print('Departamento: $departamento');
  }
}
enum Categoria{computadoras, limpieza, hombre}

class Articulos extends Departamento with Dept{
  String nombre; 
  final Categoria categoria;
  final int cantidad;

  @override
  // ignore: overridden_fields, prefer_typing_uninitialized_variables
  var departamento;

  Articulos({
    required this.nombre,
    required this.categoria,
    required this.cantidad,
    required this.departamento
  });

  @override
  String toString(){
    // ignore: non_constant_identifier_names
    final Categoria = categoria.toString().split('.').last;
    return '[Nombre: $nombre, Cantidad: $cantidad, Categoria: $Categoria]';
  }

  factory Articulos.create({
    required String nombre,
    required Categoria categoria,
    required int cantidad,
    required String departamento,
  }) {
    return Articulos(
      nombre: nombre,
      categoria: categoria,
      cantidad: cantidad,
      departamento: departamento,
    );
  }
}

void main() {
  Articulos monitor = Articulos.create(nombre: 'Monitor ACER', categoria: Categoria.computadoras, cantidad: 8, departamento: 'Tecnologia');
  monitor.printDepartamento(); 
  print(monitor); 
  print('\n');
  Articulos hogar = Articulos(nombre: 'Detergente', categoria: Categoria.limpieza, cantidad: 34, departamento: 'Hogar');
  hogar.printDepartamento();
  print(hogar);
  print('\n');
  Articulos ropa = Articulos(nombre: 'Sueter', categoria: Categoria.hombre, cantidad: 20, departamento: 'Ropa');
  ropa.printDepartamento();
  print(ropa);
}