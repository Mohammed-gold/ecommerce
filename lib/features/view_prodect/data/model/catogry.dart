class Catogrymodel {
  int? id;
  String? createdAt;
  String? name;
  String? imag;

  Catogrymodel({this.id, this.createdAt, this.name, this.imag});

  Catogrymodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    imag = json['imag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['imag'] = this.imag;
    return data;
  }
}
