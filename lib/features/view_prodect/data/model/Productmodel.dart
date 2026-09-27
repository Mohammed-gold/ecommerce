class Home {
  int? id;
  String? productName;
  String? productDescribtion;
  List<String>? productImg;
  String? createdAt;
  int? catogreId;
  double? reveiw;
  int? price;
  List<String>? colors;
  List<String>? size;

  Home({
    this.id,
    this.productName,
    this.productDescribtion,
    this.productImg,
    this.createdAt,
    this.catogreId,
    this.reveiw,
    this.price,
    this.colors,
    this.size,
  });

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    productDescribtion = json['product_describtion'];
    productImg = json['product_img'].cast<String>();
    createdAt = json['created_at'];
    catogreId = json['catogre_id'];
    reveiw = json['reveiw'];
    price = json['price'];
    colors = json['colors'].cast<String>();
    size = json['Size'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['product_describtion'] = this.productDescribtion;
    data['product_img'] = this.productImg;
    data['created_at'] = this.createdAt;
    data['catogre_id'] = this.catogreId;
    data['reveiw'] = this.reveiw;
    data['price'] = this.price;
    data['colors'] = this.colors;
    data['Size'] = this.size;
    return data;
  }
}
