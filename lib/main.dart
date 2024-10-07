import 'package:ag_market/constants.dart';
import 'package:ag_market/cubits/add_product_to_favourite_cubit/add_product_to_favourite_cubit.dart';
import 'package:ag_market/cubits/refresh_product_cubit/refresh_product_cubit.dart';
import 'package:ag_market/cubits/display_favourite_products_cubit/display_favourite_products_cubit_cubit.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/simple_bloc_observer.dart';
import 'package:ag_market/views/tabs_view.dart';
import 'package:ag_market/widgets/home_view_body.dart';
import 'package:ag_market/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(kFavouriteProductsBox);
  runApp(const AGMarket());
}

class AGMarket extends StatelessWidget {
  const AGMarket({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RefreshProductCubit()),
        BlocProvider(create: (context) => AddProductToFavouriteCubit()),
        BlocProvider(create: (context) => DisplayFavouriteProductsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        routes: {
          SplashView.id: (context) => const SplashView(),
          HomeViewBody.id: (context) => const HomeViewBody(),
          TabsView.id: (context) => const TabsView()
        },
        initialRoute: SplashView.id,
      ),
    );
  }
}
