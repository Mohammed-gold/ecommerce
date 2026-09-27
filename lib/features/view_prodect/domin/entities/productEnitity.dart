class Productenitity {
  final int? id;
  final int? price;
  final double? reveiw;
  final int? catId;
  final String? productName;
  final String? productDescribtion;
  final List<String>? productImg;
  final List<String>? color;
  final List<String>? size;
  final String? createdAt;
  Productenitity({
    this.id,
    this.productName,
    this.productDescribtion,
    this.productImg,
    this.createdAt,
    this.price,
    this.reveiw,
    this.color,
    this.size,
    this.catId,
  });
}
