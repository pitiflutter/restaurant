import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:restaurant/data/model/food.dart';
 import 'package:restaurant/data/repo/food_repository.dart';
import 'package:restaurant/data/repo/menu_repository.dart';
 import 'package:restaurant/ui/screens/home/bloc/home_bloc.dart';
import '../dishes.dart';
import '../../widgets/grid_product.dart';
import '../../widgets/home_category.dart';
import '../../widgets/slider_item.dart';
 import '../../../util/categories.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(foodRepository: foodRepository, menuRepository: menuRepository);
        homeBloc.add(HomeStarted());
        return homeBloc;
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeSuccess) {
                return ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Foods",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "View More",
                            style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return DishesScreen(
                                    foods: state.foods,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 10.0),

                    //Slider Here
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 2.4,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        aspectRatio: 2.0,
                        onPageChanged: (index, timed) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: map<Widget>(
                        state.foods,
                        (index, i) {
                          var food = state.foods[index];
                          return SliderItem(
                            img: state.foods[index].foodImage,
                            isFav: false,
                            name: state.foods[index].name,
                            rating: 5.0,
                            raters: 23,
                            foodId: state.foods[index].foodId,
                          );
                        },
                      ).toList(),
                    ),
                    SizedBox(height: 20.0),

                    Text(
                      "Food Categories",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10.0),

                    Container(
                      height: 65.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: categories == null ? 0 : categories.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map cat = categories[index];
                          return HomeCategory(
                            icon: cat['icon'],
                            tap: () {},
                            title: cat['name'],
                            items: cat['items'].toString(),
                            isHome: true,
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Popular Food",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextButton(
                          child: Text(
                            "View More",
                            style: TextStyle(
//                      fontSize: 22,
//                      fontWeight: FontWeight.w800,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),

                    GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.25),
                      ),
                      itemCount: state.foods.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Food food = state.foods[index];
                        return GridProduct(
                          foodId: food.foodId,
                          img: food.foodImage,
                          isFav: false,
                          name: food.name,
                          rating:food.rate.toString(),
                          raters: 23,
                        );
                      },
                    ),

                    SizedBox(height: 30),
                  ],
                );
              } else if (state is HomeLoading) {
                return CircularProgressIndicator();
              } else if (state is HomeError) {
                return Center(child: Text(state.appExeption.message));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
