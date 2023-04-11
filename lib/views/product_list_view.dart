import 'package:carty/viewmodels/product_viewmodel.dart';
import 'package:carty/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carty',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () => context.push('/basket'),
          ),
        ],
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, _) {
          viewModel.fetchProducts();
          if (viewModel.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListView.builder(
                itemCount: viewModel.products.length,
                itemBuilder: (context, index) {
                  final product = viewModel.products[index];
                  return ProductListItem(
                    onTap: () => context.pushNamed("product",
                        extra: viewModel.products[index]),
                    tag: "product_${product.id}",
                    imageStr: product.mainImage!,
                    name: product.name!,
                    price:
                        '${product.price!.currency} ${product.price!.amount}',
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
