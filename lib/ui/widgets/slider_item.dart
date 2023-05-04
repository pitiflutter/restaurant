import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../screens/detail/details.dart';
import '../../util/const.dart';
import '../widgets/smooth_star_rating.dart';

class SliderItem extends StatelessWidget {
  final String foodId;
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;

  SliderItem(
      {required this.foodId,
      required this.name,
      required this.img,
      required this.isFav,
      required this.rating,
      required this.raters});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.2,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: "$img",
                    placeholder: (context, url) => Center(
                      child: SizedBox(
                        height: 100,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0, top: 8.0),
            child: Text(
              "$name",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
            ),
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
                //   rating: rating,
                //   size: 10.0,
                // ),

                Text(
                  " $rating  ",
                  style: TextStyle(
                    fontSize: 11.0,
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
        ],
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductDetails(
                foodId: foodId,
              );
            },
          ),
        );
      },
    );
  }
}
