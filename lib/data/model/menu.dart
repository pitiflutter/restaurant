class Menu {
  String menuId;
  String name;

  Menu({required this.menuId,required this.name});

  Menu.fromJson(Map<String, dynamic> json):
    menuId = json['menu_id'],
    name = json['name'];


      Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_id'] = this.menuId;
    data['name'] = this.name;
    return data;
  }

  }



