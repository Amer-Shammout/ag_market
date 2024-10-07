import 'package:ag_market/widgets/categories_list_view_builder.dart';
import 'package:flutter/material.dart';

class HomeViewCustomAppBar extends StatelessWidget {
  const HomeViewCustomAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
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
        child: Column(
          children: [
                        SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_bag,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            const CategoriesListViewBuilder(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
