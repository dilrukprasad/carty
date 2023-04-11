import 'package:carty/models/cart_item_model.dart';
import 'package:carty/utilities/app_commons.dart';
import 'package:carty/utilities/app_styles.dart';
import 'package:carty/viewmodels/product_viewmodel.dart';
import 'package:carty/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          List<CartItemModel> cartItems = [];
          cartItems = viewModel.getCart();

          return cartItems.isEmpty
              ? const Center(
                  child: Text("Add products to view in Cart"),
                )
              : Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 54,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: eButton(
                          onPressed: () {},
                          style: AppStyles().bStyleFull,
                          text: 'Check Out',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(12),
                        color: Colors.blue[500],
                        child: Center(
                          child: Text(
                            "Total Price: ${viewModel.getTotal()}",
                            style: AppStyles().f18w5cw,
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: viewModel.getCartLength(),
                      itemBuilder: (count, index) {
                        return CartItem(
                          imageStr: cartItems[index].product!.mainImage!,
                          text:
                              "${cartItems[index].product!.name!}\n${cartItems[index].product!.price!.currency} ${cartItems[index].product!.price!.amount}",
                          onPressed: () => viewModel.removeCart(context),
                        );
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }
}
