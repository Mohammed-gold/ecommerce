import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/core/const/url.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/catogry_state.dart';
import 'package:ecom/features/view_prodect/presentation/cubit/deitals_cubit.dart';
import 'package:ecom/features/view_prodect/presentation/pages/catogery_v.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categoryv extends StatelessWidget {
  final CatogryLoaded state;
  final bool t;
  int? id;

  Categoryv({super.key, required this.state, required this.t, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 140,
      width: MediaQuery.sizeOf(context).width / 2,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,

        itemCount: 6,

        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (t == true) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      CatogeryVe(catid: state.catogry![index]!.id),
                ),
              );
            } else {
              BlocProvider.of<DeitalsCubit>(
                context,
              ).getDietals(state.catogry![index]!.id.toString(), "");
            }
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                padding: EdgeInsets.all(13),

                width: MediaQuery.sizeOf(context).width / 4.0,
                height: MediaQuery.sizeOf(context).width / 4.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: const Color.fromARGB(34, 114, 112, 112),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: "${ProductUrl.imgurl + state.catogry![index]!.img}",
                ),
              ),
              SizedBox(height: 10),
              Text(
                "${state.catogry![index]!.name}",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
