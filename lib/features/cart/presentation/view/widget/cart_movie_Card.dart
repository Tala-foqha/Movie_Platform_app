// features/cart/presentation/view/widget/cart_movie_Card.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/features/cart/data/models/cart_response.dart';
import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';

class CartMovieCard extends StatelessWidget {
final bool isLoading;
  const CartMovieCard({
   super.key,  this.isLoading=false,  this.cart,
     
  });
  final CartResponse? cart;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
    
      key: ValueKey(isLoading ? UniqueKey() : cart!.movie.name),
      direction:
          isLoading ? DismissDirection.none : DismissDirection.endToStart,

      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
          size: 28,
        ),
      ),

      onDismissed: (direction) async{
     return await   context.read<CartCubit>().deletMovieFromCart(cart!.movieId);
      },

      child: Container(
        height: 125,
        decoration: BoxDecoration(
          color:const Color(0xff151515),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xff20242D),
          ),
        ),
        child: isLoading
            ? _buildLoadingCard()
            : _buildMovieCard(),
      ),
    );
  }

  // =========================
  // Loading Card
  // =========================

  Widget _buildLoadingCard() {
    return Row(
      children: [
        Container(
          width: 90,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: const Color(0xff151515),
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(16),
            ),
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 18,
                        decoration: BoxDecoration(
                          color: const Color(0xff151515),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Container(
                      width: 55,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xff20242D),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Container(
                  width: 70,
                  height: 13,
                  decoration: BoxDecoration(
                    color: const Color(0xff20242D),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: 45,
                  height: 13,
                  decoration: BoxDecoration(
                    color: const Color(0xff20242D),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // =========================
  // Normal Movie Card
  // =========================

  Widget _buildMovieCard() {

    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(16),
          ),
          child: Image.network(
           cart!.movie.mainImage ,
            width: 90,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(width: 14),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        cart!.movie.name 
                        ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    Text(
                      '\$${cart!.movie.price}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 80, 75, 75),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                const Text(
                  'Sci-Fi',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 5),

                const Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: 17,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '8.7',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}