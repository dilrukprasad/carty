import 'package:carty/utilities/app_commons.dart';
import 'package:carty/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:carty/models/cart_item_model.dart';
import 'package:carty/models/product_model.dart';
import 'package:carty/services/product_repository.dart';

class ProductViewModel extends ChangeNotifier {
  late CartItemModel? cart;

  final ProductRepository _repository = ProductRepository();
  final CartViewModel _cartService = CartViewModel();

  List<Datum> productsList = [];
  ProductViewModel({
    this.cart,
  });
  List<Datum> get products => productsList;

  bool _itemIsAdded = false;
  bool get itemIsAdded => _itemIsAdded;

  String getTotal() {
    return '${_cartService.items[0].product!.price!.currency} ${_cartService.total}';
  }

  List<CartItemModel> getCart() {
    return _cartService.items;
  }

  int getCartLength() {
    return _cartService.items.length;
  }

  addToCart(Datum item, BuildContext context) {
    _cartService.add(item);
    final snackBar = commonSnackBar('${item.name} is added to cart');
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    _itemIsAdded = true;
    notifyListeners();
  }

  removeCart(BuildContext context) {
    if (productsList.isNotEmpty) {
      _cartService.clear();
      final snackBar = commonSnackBar('Cart is cleared');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = commonSnackBar('Cart is empty');
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    notifyListeners();
  }

  deleteFromCart(CartItemModel item, BuildContext context) {
    _cartService.remove(item);
    final snackBar =
        commonSnackBar('${item.product!.name} is removed from cart');
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    try {
      productsList = await _repository.getProducts();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
