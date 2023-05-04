import 'package:flutter/material.dart';
import '../../data/model/food.dart';
import '../screens/notifications.dart';
import '../../util/foods.dart';
import '../widgets/badge.dart';
import '../widgets/grid_product.dart';

class DishesScreen extends StatefulWidget {
  final List<Food> foods;

  const DishesScreen({super.key, required this.foods});
  @override
  _DishesScreenState createState() => _DishesScreenState();
}

class _DishesScreenState extends State<DishesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          "Dishes",
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            Text(
              "Chinese",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
              maxLines: 2,
            ),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.25),
              ),
              itemCount: widget.foods.length,
              itemBuilder: (BuildContext context, int index) {
                String foodImg = widget.foods[index].foodImage;
                String foodName = widget.foods[index].name;
                String foodRate = widget.foods[index].rate.toString();
                String foodId = widget.foods[index].foodId;
                return GridProduct(
                  foodId:foodId, 
                  img: foodImg,
                  isFav: false,
                  name: foodName,
                  rating: foodRate,
                  raters: 23,
                );
              },
            ),
        ],
        ),
      ),
    );
  }
}
