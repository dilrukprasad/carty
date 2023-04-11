import 'package:carty/models/cart_item_model.dart';
import 'package:carty/models/product_model.dart';
import 'package:flutter/foundation.dart';

class CartViewModel extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  double get total => _items.fold(
      0,
      (sum, item) =>
          sum +
          double.parse(item.product!.price!.amount!) *
              double.parse(item.quantity.toString()));

  void add(Datum product) {
    final index = _items.indexWhere((item) => item.product!.id == product.id);
    if (index != -1) {
      _items[index].quantity! + 1;
    } else {
      _items.add(CartItemModel(product: product));
    }
    product.inCart = true;
    notifyListeners();
  }

  void remove(CartItemModel item) {
    _items.remove(item);
    item.product!.inCart = false;
    notifyListeners();
  }

  void clear() {
    for (var item in _items) {
      item.product!.inCart = false;
    }
    _items.clear();
    notifyListeners();
  }
}
