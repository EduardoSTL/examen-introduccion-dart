enum Categoria { computadoras, limpieza, hombre }

abstract class Departamento {
  String get departamento;
}

mixin Dept on Departamento {
  void printDepartamento() {
    print('Departamento: $departamento');
  }
}

class Articulos extends Departamento with Dept {
  String nombre;
  final Categoria categoria;
  final double precio;
  //retrasar inicializacion de variable
  late List<int> stock;
  int cantidadOrden = 0;

  @override
  final String departamento;

  Articulos({
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.departamento,
    List<int> stock = const [],
  }) : super() {
    //* lista stock que se pasa como argumento al constructor, vinculada a la propiedad stock de la instancia de Articulos
    this.stock = stock;
  }

  double get precioTotal => cantidadOrden * precio; // calcula el precio total de una orden

  @override
  String toString() {
    final categoriaStr = categoria.toString().split('.').last;
    return '[Nombre: $nombre, Stock: $stock, Cantidad Ordenada: $cantidadOrden, Precio: \$$precio, Precio Total: \$$precioTotal, Categoria: $categoriaStr]';
  }

  //constructor factory para crear instancias de articulos
  factory Articulos.create({
    required String nombre,
    required Categoria categoria,
    required double precio,
    required String departamento,
    List<int> stock = const [],
  }) {
    return Articulos(
      nombre: nombre,
      categoria: categoria,
      precio: precio,
      departamento: departamento,
      stock: stock,
    );
  }
}

void main() {
  //* funcion para imprimir cada art. instanciado y al dept. al que pertenece
  void imprimirArticulo(Articulos articulo) {
    articulo.printDepartamento();
    print(articulo);
    print('\n');
  }

  //instancias de articulos
  final orden1 = Articulos.create(nombre: 'Monitor ACER',categoria: Categoria.computadoras,stock: [11],precio: 200.0,departamento: 'Tecnologia',);
  orden1.cantidadOrden = 5;
  imprimirArticulo(orden1);
  final orden2 = Articulos(nombre: 'Detergente',categoria: Categoria.limpieza,stock: [34],precio: 35.0,departamento: 'Hogar',);
  orden2.cantidadOrden = 10;
  imprimirArticulo(orden2);
  final orden3 = Articulos(nombre: 'Suéter',categoria: Categoria.hombre,stock: [20],precio: 40.0,departamento: 'Ropa',);
  orden3.cantidadOrden = 3;
  imprimirArticulo(orden3);
}