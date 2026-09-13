// features/cart/presentation/view/cart_view.dart
import 'package:flutter/material.dart';

import 'package:movie_platform_app/features/cart/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routName = "cart-view";
  @override
  Widget build(BuildContext context) {
    return 
     
       CartViewBody();
  }
}
