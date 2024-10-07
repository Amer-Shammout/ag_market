import 'package:ag_market/services/get_categories_service.dart';
import 'package:ag_market/shimmer/categories_list_view_shimmer.dart';
import 'package:ag_market/widgets/categories_list_view.dart';
import 'package:flutter/material.dart';

late Future<List<String>> future;
bool loadCategoriesFirstTime = true;

class CategoriesListViewBuilder extends StatefulWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  State<CategoriesListViewBuilder> createState() =>
      _CategoriesListViewBuilderState();
}

class _CategoriesListViewBuilderState extends State<CategoriesListViewBuilder> {
  @override
  void initState() {
    if (loadCategoriesFirstTime) {
      future = GetCategoriesService().getCategories();
      loadCategoriesFirstTime = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CategoriesListView(
            categories: snapshot.data!,
          );
        } else {
          return const CategoriesListViewShimmer();
        }
      },
    );
  }
}


