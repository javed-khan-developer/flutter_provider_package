class ProductModel {
  int? id;
  String? name;
  int? price;
  ProductModel({
    this.id,
    this.name,
    this.price,
  });
  static List<ProductModel> products = [
    ProductModel(id: 1, name: 'product 1', price: 100),
    ProductModel(id: 2, name: 'product 2', price: 500),
    ProductModel(id: 3, name: 'product 3', price: 140),
    ProductModel(id: 4, name: 'product 4', price: 108),
    ProductModel(id: 5, name: 'product 5', price: 106),
    ProductModel(id: 6, name: 'product 6', price: 180),
    ProductModel(id: 7, name: 'product 7', price: 130),
    ProductModel(id: 8, name: 'product 8', price: 104),
    ProductModel(id: 9, name: 'product 9', price: 1003),
    ProductModel(id: 10, name: 'product 10', price: 103),
    ProductModel(id: 11, name: 'product 11', price: 101),
    ProductModel(id: 12, name: 'product 12', price: 1007),
    ProductModel(id: 13, name: 'product 13', price: 100),
    ProductModel(id: 14, name: 'product 14', price: 2100),
  ];
}
