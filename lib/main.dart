import 'package:ecom/fetcher/view_prodect/domin/usecases/GetProductUsecase.dart';

import 'package:ecom/fetcher/view_prodect/presentation/cubit/product_cubit.dart';
import 'package:ecom/fetcher/view_prodect/presentation/pages/Product_viwe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(getproductusecase: Getproductusecase()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.getproductusecase});
  final Getproductusecase getproductusecase;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getproductusecase),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: ProductViwe(),
      ),
    );
  }
}
