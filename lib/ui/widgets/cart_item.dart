import 'package:flutter/material.dart';
import '../screens/detail/details.dart';
import '../../util/const.dart';
import '../widgets/smooth_star_rating.dart';


class CartItem extends StatelessWidget {
  final String name;
  final String img;
  final bool isFav;
  final double rating;
  final int raters;


  CartItem({
     required this.name,
    required this.img,
    required this.isFav,
    required this.rating,
    required this.raters})
     ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return ProductDetails(foodId: "",);
              },
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
              child: Container(
                height: MediaQuery.of(context).size.width/3.5,
                width: MediaQuery.of(context).size.width/3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "$img",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "$name",
                  style: TextStyle(
//                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    // SmoothStarRating(
                    //   onRatingChanged: (value){print(value);},
                    //   borderColor: Colors.red,
                    //   starCount: 1,
                    //   color: Constants.ratingBG,
                    //   allowHalfRating: true,
                    //   rating: 5.0,
                    //   size: 12.0,
                    // ),
                    SizedBox(width: 6.0),
                    Text(
                      "5.0 (23 Reviews)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text(
                      "20 Pieces",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(width: 10.0),

                    Text(
                      r"$90",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).accentColor,
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10.0),

                Text(
                  "Quantity: 1",
                  style: TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),


              ],

            ),
          ],
        ),
      ),
    );
  }
}
