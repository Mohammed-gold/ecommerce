class Discont {
  int? id;
  String? createdAt;
  int? itemId;
  int? categoryId;
  String? discountImag;
  String? discount;

  Discont({
    this.id,
    this.createdAt,
    this.itemId,
    this.categoryId,
    this.discountImag,
    this.discount,
  });

  Discont.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    itemId = json['item_id'];
    categoryId = json['category_id'];
    discountImag = json['discount_imag'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['item_id'] = this.itemId;
    data['category_id'] = this.categoryId;
    data['discount_imag'] = this.discountImag;
    data['discount'] = this.discount;
    return data;
  }
}
