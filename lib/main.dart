import 'package:ecom/features/auth/presntion/cubit/signin_cubit.dart';
import 'package:ecom/features/auth/presntion/cubit/signup_cubit.dart';
import 'package:ecom/features/auth/presntion/screen/Sigin.dart';
import 'package:ecom/features/auth/presntion/screen/signup.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecom/features/cart/presentation/cubit/cart_item_cubit.dart';
import 'package:ecom/features/view_prodect/data/repositories/product_repositories.dart';

import 'package:ecom/features/view_prodect/domin/usecases/GetProductUsecase.dart';
import 'package:ecom/features/view_prodect/domin/usecases/catogry.dart';
import 'package:ecom/features/view_prodect/domin/usecases/deitals.dart';
import 'package:ecom/features/view_prodect/domin/usecases/discount.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/discount_cubit.dart';

import 'package:ecom/features/view_prodect/presentation/cubit/product_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/pages/Product_viwe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://lxxjhxibpktdbffsgxgf.supabase.co",
    publishableKey: "sb_publishable_DnyBNo-YK3pHqQEPHqdK2w_Ja03CCdf",
  );

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
  var supabase = Supabase.instance.client.auth.currentUser;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CatogryCubit(catogryUsecase)),
        BlocProvider(create: (context) => ProductCubit(getproductusecase)),
        BlocProvider(create: (context) => DiscountCubit(Discountusecase())),
        BlocProvider(
          create: (context) =>
              DeitalsCubit(Deitalsusecase(ProductRepositories())),
        ),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => SigninCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => CartItemCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        //
        home: supabase != null ? ProductViwe() : Sigin(),
      ),
    );
  }
}
