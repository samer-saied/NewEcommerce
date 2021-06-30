import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'const/appConst.dart';
import 'cubit/ecommercecubit_cubit.dart';
import 'cubit/observe.dart';
import 'views/screens/detailsScreen.dart';
import 'views/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/screens/boardScreen.dart';
import 'views/screens/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EcommerceCubit(),
      child: MaterialApp(
        color: mainColor,
        debugShowCheckedModeBanner: false,
        title: 'Eldokana',
        theme: lightThemeData,
        home: BoardScreen(),
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
