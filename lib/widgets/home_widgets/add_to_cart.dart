import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddTocart extends StatefulWidget {
  final Item catalog;
  const AddTocart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  State<AddTocart> createState() => _AddTocartState();
}

class _AddTocartState extends State<AddTocart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          isInCart = isInCart.toggle();
          final _catalog = CatalogModel();
          _cart.add(widget.catalog);
          _cart.catalog = _catalog;
          setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor:
            // ignore: deprecated_member_use
            MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
