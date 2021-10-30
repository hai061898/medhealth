class ProductModel {
  final String? idProduct;
  final String? idCategory;
  final String? nameProduct;
  final String? description;
  final String? imageProduct;
  final String? price;
  final String? status;
  final String? createdAt;

  ProductModel({
    this.idProduct,
    this.idCategory,
    this.nameProduct,
    this.description,
    this.imageProduct,
    this.price,
    this.status,
    this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      idProduct: data['id_product'],
      idCategory: data['id_category'],
      nameProduct: data['name'],
      description: data['description'],
      imageProduct: data['image'],
      price: data['price'],
      status: data['status'],
      createdAt: data['created_at'],
    );
  }
}