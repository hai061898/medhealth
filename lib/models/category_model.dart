import 'package:medhealth/models/product_model.dart';

class CategoryWithProduct {
  final String? idCategory;
  final String? category;
  final String? image;
  final String? status;
  final List<ProductModel>? product;

  CategoryWithProduct(
      {this.idCategory, this.category, this.image, this.status, this.product});

  factory CategoryWithProduct.fromJson(Map<String, dynamic> data) {
    var list = data['product'] as List;
    List<ProductModel> listProduct =
        list.map((e) => ProductModel.fromJson(e)).toList();
    return CategoryWithProduct(
        idCategory: data['idCategory'],
        category: data['category'],
        image: data['image'],
        status: data['status'],
        product: listProduct);
  }
}