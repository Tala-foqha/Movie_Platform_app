// features/cart/presentation/view/widget/checkout_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_platform_app/core/utils/app_styles.dart';
import 'package:movie_platform_app/core/widgets/custom_button.dart';
import 'package:movie_platform_app/features/cart/presentation/manager/cart/cart_cubit.dart';
import 'package:movie_platform_app/features/checkout/presentation/manager/checkout/checkout_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            double totalPrice = 0;

            if (state is GetCartSuccess) {
              totalPrice = state.totalPrice;
            }

            return Row(
              children: [
                Text(
                  'Total Price',
                  style: AppStyles.semiBold18.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: AppStyles.semiBold18.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 15),

        BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) async {
  if (state is CheckoutSuccess) {
    final stripeUrl = state.checkoutResponse.stripeUrl;

    print('STRIPE URL = $stripeUrl');

    final uri = Uri.parse(stripeUrl!);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  if (state is CheckoutFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
      ),
    );
  }
},
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const SizedBox(
                width: double.infinity,
                height: 55,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              );
            }

            return SizedBox(
              width: double.infinity,
              height: 55,
              child: CustomButton(
                onTap: () {
                  context.read<CheckoutCubit>().checkout();
                },
                text: 'Checkout',
              ),
            );
          },
        ),
      ],
    );
  }
}