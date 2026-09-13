// features/cart/presentation/view/widget/list_view_cart_bloc_consumer.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:movie_platform_app/features/cart/presentation/view/widget/cart_movie_Card.dart';

class ListViewCartBlocConsumer extends StatelessWidget {
  const ListViewCartBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is GetCartFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GetCartLoading) {
          return Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: const CartMovieCard(
                  isLoading: true,
                ),
              ),
            ),
          );
        }
    
        if (state is GetCartSuccess) {
          print('CART LENGTH = ${state.carts.length}');
    
          final cart = state.carts;
    
          return Column(
            children: List.generate(
              cart.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CartMovieCard(
                    cart: cart[index],
                  ),
                );
              },
            ),
          );
        }
    
        if (state is GetCartFailure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
    
        return const SizedBox();
      },
    );
  }
}