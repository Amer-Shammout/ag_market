import 'package:ag_market/constants.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag,
            color: kPrimaryColor,
            size: MediaQuery.of(context).size.width * .4,
          ),
          const Text(
            "AG Market",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          )
        ],
      ),
    );
  }
}
