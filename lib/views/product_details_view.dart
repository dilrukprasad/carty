import 'package:carty/models/product_model.dart';
import 'package:carty/utilities/app_commons.dart';
import 'package:carty/utilities/app_styles.dart';
import 'package:carty/viewmodels/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDetailsView extends StatelessWidget {
  final Datum product;
  const ProductDetailsView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            title: Row(
              children: [
                const Spacer(),
                InkWell(
                  onTap: () => context.push('/basket'),
                  child: Container(
                    alignment: Alignment.center,
                    height: 36,
                    width: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(36)),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "product_${product.id}",
                child: Image.network(
                  product.mainImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            floating: false,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(16),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    top: 10.0,
                  ),
                  child: Text(
                    product.name!,
                    style: AppStyles().f20w5cw,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Consumer<ProductViewModel>(
                builder: (context, viewModel, child) => Container(
                  width: double.infinity,
                  color: Colors.blue.withOpacity(0.7),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 4,
                          padding: const EdgeInsets.all(10),
                          color: Colors.blue[300],
                        ),
                      ),
                      const SizedBox(height: 24),
                      RichText(
                        text: TextSpan(
                          text: 'Brand: ',
                          style: AppStyles().f16w3,
                          children: <TextSpan>[
                            TextSpan(
                              text: product.brandName!,
                              style: AppStyles().f18w5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Description: ',
                          style: AppStyles().f16w3,
                          children: <TextSpan>[
                            TextSpan(
                              text: '\n${product.description!}',
                              style: AppStyles().f18w5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Color: ',
                          style: AppStyles().f16w3,
                          children: <TextSpan>[
                            TextSpan(
                              text: product.colour!,
                              style: AppStyles().f18w5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Stock Status: ',
                          style: AppStyles().f16w3,
                          children: <TextSpan>[
                            TextSpan(
                              text: product.stockStatus!,
                              style: AppStyles().f18w5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'Price: ',
                          style: AppStyles().f16w3,
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  '${product.price!.currency!} ${product.price!.amount!}',
                              style: AppStyles().f18w5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: 'SKU: ',
                          style: AppStyles().f16w3,
                          children: <TextSpan>[
                            TextSpan(
                              text: product.sku!,
                              style: AppStyles().f18w5,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Align(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: eButton(
                            onPressed: () {},
                            style: AppStyles().bStyleFull,
                            text: 'Buy Now',
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: eButton(
                            onPressed: () =>
                                viewModel.addToCart(product, context),
                            style: AppStyles().bStyleBorder,
                            text: 'Add to Basket',
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: eButton(
                            onPressed: () => context.go('/'),
                            style: AppStyles().bStyleBorder,
                            text: 'Back to List',
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 4,
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
