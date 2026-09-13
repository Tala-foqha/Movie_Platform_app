// features/cart/presentation/view/widget/cart_header_widget.dart

import 'package:flutter/material.dart';

class CartHeaderWidget extends StatelessWidget {
  const CartHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "My Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const Spacer(),
    
        const Badge(
          backgroundColor: Colors.red,
          smallSize: 8,
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}