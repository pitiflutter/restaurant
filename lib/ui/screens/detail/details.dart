import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/exeptions.dart';
import 'package:restaurant/data/repo/food_detail_rapository.dart';
import 'package:restaurant/ui/screens/detail/bloc/detail_bloc.dart';
import '../notifications.dart';
import '../../../util/comments.dart';
import '../../../util/const.dart';
import '../../../util/foods.dart';
import '../../widgets/badge.dart';
import '../../widgets/smooth_star_rating.dart';

class ProductDetails extends StatefulWidget {
  final String foodId;

  const ProductDetails({super.key, required this.foodId});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final detailBloc = DetailBloc(
            foodDetailRepository: foodDetailRepository, foodId: widget.foodId);
        detailBloc.add(DetailStarted());
        return detailBloc;
      },
      child: Scaffold(
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
            "Item Details",
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
            child: BlocBuilder<DetailBloc, DetailState>(
              builder: (context, state) {
                if (state is DetailSuccess) {
                  return ListView(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 3.2,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: state.foodDetail.foodImage!,
                                placeholder: (context, url) => Center(
                                  child: SizedBox(
                                    height: 100,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Positioned(
                            right: -10.0,
                            bottom: 3.0,
                            child: RawMaterialButton(
                              onPressed: () {},
                              fillColor: Colors.white,
                              shape: CircleBorder(),
                              elevation: 4.0,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        state.foodDetail.name!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
                        child: Row(
                          children: <Widget>[
                            // SmoothStarRating(
                            //   onRatingChanged: (value){print(value);},
                            //   borderColor: Colors.red,
                            //   starCount: 5,
                            //   color: Constants.ratingBG,
                            //   allowHalfRating: true,
                            //   rating: 5.0,
                            //   size: 10.0,
                            // ),
                            SizedBox(width: 10.0),

                            Text(
                              "${state.foodDetail.rate!} ",
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                            SizedBox(
                                height: 20,
                                child: Icon(
                                  Icons.star,
                                  size: 20,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0, top: 2.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10.0),
                            Text(
                              "${state.foodDetail.price!} \$",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Product Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        state.foodDetail.description!,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 2,
                      ),
                      SizedBox(height: 20.0),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: comments == null ? 0 : comments.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map comment = comments[index];
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage(
                                "${comment['img']}",
                              ),
                            ),
                            title: Text("${comment['name']}"),
                            subtitle: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    // SmoothStarRating(
                                    //   onRatingChanged: (value){print(value);},
                                    //   borderColor: Colors.red,
                                    //   starCount: 5,
                                    //   color: Constants.ratingBG,
                                    //   allowHalfRating: true,
                                    //   rating: 5.0,
                                    //   size: 12.0,
                                    // ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      "February 14, 2020",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  "${comment["comment"]}",
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10.0),
                    ],
                  );
                } else if (state is DetailLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DetailError) {
                  return Center(child: Text(state.appExeption.message));
                } else {
                  return Container();
                }
              },
            )),
        bottomNavigationBar: Container(
          height: 50.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).accentColor),
            child: Text(
              "ADD TO CART",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
