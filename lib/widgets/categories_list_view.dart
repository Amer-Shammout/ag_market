import 'package:ag_market/cubits/cubit/refresh_product_cubit.dart';
import 'package:ag_market/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key, required this.categories});

  final List<String> categories;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<RefreshProductCubit>(context).refreshProducts(widget.categories[index]);
              setState(() {});
            },
            child: CategoryItem(
              categoryName: widget.categories[index],
              isActive: currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}

  int currentIndex = 0;

