import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/ui/screens/auth/bloc/auth_bloc.dart';

import '../../../data/repo/auth_repository.dart';
import '../login.dart';
import '../register.dart';

class JoinApp extends StatefulWidget {
  @override
  _JoinAppState createState() => _JoinAppState();
}

class _JoinAppState extends State<JoinApp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
          tabs: const <Widget>[
            Tab(
              text: "Login",
            ),
            Tab(
              text: "Register",
            ),
          ],
        ),
      ),
      body: BlocProvider<AuthBloc>(
        create: (context) {
          final bloc = AuthBloc(authRepository);
          bloc.add(AuthStarted());
          bloc.stream.forEach((element) {
            if (element is AuthSuccess) {
              Navigator.of(context).pop(); 
            }else if (element is AuthError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(element.appExeption.message)));
            }
          });
          return bloc;
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            return current is AuthLoading ||
                current is AuthInitial ||
                current is AuthError;
          },
          builder: (context, state) {
            return TabBarView(
              controller: _tabController,
              children: <Widget>[
                LoginScreen(blocState: state),
                RegisterScreen(
                  blocState: state,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
