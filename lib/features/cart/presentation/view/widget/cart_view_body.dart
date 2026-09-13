// features/cart/presentation/view/widget/cart_view_body.dart

import 'package:flutter/material.dart';
import 'package:movie_platform_app/features/cart/presentation/view/widget/cart_header_widget.dart';
import 'package:movie_platform_app/features/cart/presentation/view/widget/checkout_widget.dart';
import 'package:movie_platform_app/features/cart/presentation/view/widget/list_view_cart_bloc_consumer.dart';
import 'package:movie_platform_app/features/home/home_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  HomeView.routeName,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 3),

          // الجزء اللي بعمل Scroll
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              children: [
                const SizedBox(height: 10),

                const CartHeaderWidget(),

                const SizedBox(height: 25),

                const ListViewCartBlocConsumer(),

                const SizedBox(height: 20),
              ],
            ),
          ),

          // ثابت بالأسفل
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              25,
            ),
            decoration: const BoxDecoration(
              color: Color(0xff292929),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: CheckoutWidget(),
          ),
        ],
      ),
    );
  }
}
