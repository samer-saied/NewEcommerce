import 'package:ecommerceproject/cubit/ecommerceApp/ecommerce_cubit.dart';
import 'package:ecommerceproject/views/widgets/appComponant.dart';
import 'package:ecommerceproject/views/widgets/homecomponant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceCubit, EcommerceState>(
      listener: (context, state) {},
      builder: (context, state) {
        ///
        var ecommerceCubit = EcommerceCubit().get(context);
        return Scaffold(
          // status bar brightness,
          body: SafeArea(
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    topBanner(context),
                    sliderBanner(items: ecommerceCubit.getBanneritems),
                    SizedBox(height: 10),
                    titleText(context: context, text: 'Categories'),
                    categoryIconsList(),
                    titleTextWithViewAll(context: context),
                    productGridList(ecommerceCubit.products),
                  ],
                )),
          ),
          bottomNavigationBar: getNavBar(),
        );
      },
    );
  }
}
