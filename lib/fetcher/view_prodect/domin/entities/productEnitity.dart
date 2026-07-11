import 'package:ecom/fetcher/view_prodect/data/model/Productmodel.dart';

class Productenitity {
  final int? id;
  final String? productname;
  final int? ProductPrice;
  final List? imag;
  final Category? category;
  Productenitity({
    required this.id,
    required this.productname,
    required this.ProductPrice,
    required this.imag,
    this.category,
  });
}
