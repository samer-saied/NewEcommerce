import 'package:bloc/bloc.dart';
import 'package:ecommerceproject/cubit/auth/authapp_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'const/appConst.dart';
import 'package:ecommerceproject/cubit/ecommerceApp/ecommerce_cubit.dart';
import 'cubit/observe.dart';
import 'services/FirebaseConnect.dart';
import 'views/screens/detailsScreen.dart';
import 'views/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/screens/boardScreen.dart';
import 'views/screens/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await FirebaseService.initializeFlutterFire();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EcommerceCubit(),
        ),
        BlocProvider(
          create: (context) => AuthappCubit(),
        ),
      ],
      child: MaterialApp(
        color: mainColor,
        debugShowCheckedModeBanner: false,
        title: 'Eldokana',
        theme: lightThemeData,
        home: LoginScreen(),
        //////////////////
        /////////////
        ///
        routes: {
          '/boardScreen': (context) => BoardScreen(),
          '/homeScreen': (context) => MyHomePage(),
          '/detailScreen': (context) => DetailsScreen(),
          '/loginScreen': (context) => LoginScreen(),
        },
        // initialRoute: '/BoardScreen',
      ),
    );
  }
}
