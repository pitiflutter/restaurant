import 'package:flutter/material.dart';
import 'package:restaurant/data/model/auth_info.dart';
import 'package:restaurant/data/repo/auth_repository.dart';
import 'package:restaurant/ui/screens/auth/auth.dart';
import '../screens/checkout.dart';
import '../../util/foods.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin<CartScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ValueListenableBuilder<AuthInfo?>(
          valueListenable: AuthRepository.authChangeNotifier,
          builder: (context, state, child) {
            bool isAuth = state != null && state.accessToken.isNotEmpty;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isAuth ? "welcome " : "please login"),
                if (!isAuth)
                  ElevatedButton(
                      onPressed:(){ Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context)=>  JoinApp()));},

                      child: Text("login"))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: "Checkout",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Checkout();
              },
            ),
          );
        },
        child: Icon(
          Icons.arrow_forward,
        ),
        heroTag: Object(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
