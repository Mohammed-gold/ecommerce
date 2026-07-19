import 'package:ecom/features/view_prodect/domin/usecases/GetProductUsecase.dart';
import 'package:ecom/features/view_prodect/domin/usecases/catogry.dart';
import 'package:ecom/features/view_prodect/domin/usecases/discount.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_cubit.dart';

import 'package:ecom/features/view_prodect/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/pages/Product_viwe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MyApp(
      getproductusecase: Getproductusecase(),
      catogryUsecase: CatogryUsecase(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
    required this.getproductusecase,
    required this.catogryUsecase,
  });
  final Getproductusecase getproductusecase;
  final CatogryUsecase catogryUsecase;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CatogryCubit(catogryUsecase)),
        BlocProvider(create: (context) => ProductCubit(getproductusecase)),
        BlocProvider(create: (context) => DiscountCubit(Discountusecase())),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ProductViwe(),
      ),
    );
  }
}
