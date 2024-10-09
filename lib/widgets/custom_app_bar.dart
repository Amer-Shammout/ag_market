import 'package:ag_market/helper/get_responsive_font_size.dart';
import 'package:flutter/material.dart';

class GeneralCustomAppBar extends StatelessWidget {
  const GeneralCustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xfffdfdfd),
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:  TextStyle(
                  color: Colors.black,
                  fontSize: getResponsiveFontSize(context, baseFontSize: 20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon:  Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                  size: getResponsiveFontSize(context, baseFontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
