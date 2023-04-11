import 'package:carty/utilities/app_styles.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String? imageStr;
  final String? text;
  final Function()? onPressed;
  const CartItem({
    super.key,
    this.imageStr,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: NetworkImage(imageStr!), fit: BoxFit.cover)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text!,
                style: AppStyles().f12w4,
              ),
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Colors.blue[500],
              ),
            ),
          )
        ],
      ),
    );
  }
}
