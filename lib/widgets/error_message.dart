import 'package:ag_market/cubits/refresh_product_cubit/refresh_product_cubit.dart';
import 'package:ag_market/widgets/categories_list_view.dart';
import 'package:ag_market/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/error_animation.json'),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Sorry something went wrong!",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onPressed: () {
              BlocProvider.of<RefreshProductCubit>(context)
                  .refreshProducts(category);
            },
            title: "Try Again",
          ),
          const SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}

