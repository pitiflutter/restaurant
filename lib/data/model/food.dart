class Food {
  final String sId;
  final String description;
  final String foodId;
  final String foodImage;
  final String menuId;
  final String name;
  final dynamic price;
  final dynamic rate;

  Food(this.sId, this.description, this.foodId, this.foodImage, this.menuId,
      this.name, this.price, this.rate);

  Food.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        description = json['description'],
        foodId = json['food_id'],
        foodImage = json['food_image'],
        menuId = json['menu_id'],
        name = json['name'],
        price = json['price'],
        rate = json['rate'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['food_id'] = this.foodId;
    data['food_image'] = this.foodImage;
    data['menu_id'] = this.menuId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['rate'] = this.rate;
    return data;
  }
}


class FoodDetail {
  String? iD;
  String? name;
  dynamic price;
  String? foodImage;
  String? description;
  String? createdAt;
  String? updateAt;
  String? foodId;
  String? menuId;
  dynamic  rate;

  FoodDetail(
      {this.iD,
      this.name,
      this.price,
      this.foodImage,
      this.description,
      this.createdAt,
      this.updateAt,
      this.foodId,
      this.menuId,
      this.rate});

  FoodDetail.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['name'];
    price = json['price'];
    foodImage = json['food_image'];
    description = json['description'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    foodId = json['food_id'];
    menuId = json['menu_id'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['name'] = this.name;
    data['price'] = this.price;
    data['food_image'] = this.foodImage;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    data['food_id'] = this.foodId;
    data['menu_id'] = this.menuId;
    data['rate'] = this.rate;
    return data;
  }
}