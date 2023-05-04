class Food {
  final String img;
  final String name;

  Food(this.img, this.name);

  Food.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        img = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img'] = this.img;
    data['name'] = this.name;
    return data;
  }
}
