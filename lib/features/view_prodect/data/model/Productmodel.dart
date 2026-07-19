class Home {
  int? id;
  String? productName;
  String? productDescribtion;
  String? productImg;
  String? createdAt;

  Home({
    this.id,
    this.productName,
    this.productDescribtion,
    this.productImg,
    this.createdAt,
  });

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productDescribtion = json['product_describtion'];
    productImg = json['product_img'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_describtion'] = this.productDescribtion;
    data['product_img'] = this.productImg;
    data['created_at'] = this.createdAt;
    return data;
  }
}
