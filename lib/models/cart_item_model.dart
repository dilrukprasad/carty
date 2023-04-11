import 'package:carty/models/product_model.dart';

class CartItemModel {
  final Datum? product;
  int? quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });
}
