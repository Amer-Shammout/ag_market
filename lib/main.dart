import 'package:ag_market/constants.dart';
import 'package:ag_market/models/product_model.dart';
import 'package:ag_market/simple_bloc_observer.dart';
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
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: SplashView(),
    );
  }
}

