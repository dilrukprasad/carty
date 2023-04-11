import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Function()? onTap;
  final String? tag;
  final String? imageStr;
  final String? name;
  final String? price;
  const ProductListItem({
    super.key,
    this.onTap,
    this.tag,
    this.imageStr,
    this.name,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
          tag: tag!,
          child: CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              imageStr!,
            ),
          )),
      title: Text(
        name!,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        price!,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }
}
