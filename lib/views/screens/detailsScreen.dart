import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/models/products.dart';
import 'package:ecommerceproject/views/widgets/detailsComponant.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      child: Scaffold(
          //backgroundColor: backColor,
          body: orientation == Orientation.portrait
              ? portraitViewDetail(context, product)
              : landscapeViewDetail(context, product)),
    );
  }

  Widget landscapeViewDetail(BuildContext context, Product product) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Stack(
            children: [
              Image(
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2,
                image: NetworkImage("${product.img}"),
              ),
              backDetailsButton(context)
            ],
          ),
        ),
        Expanded(
          child: SafeArea(
              child:
                  productDetailsDataWidget(context: context, product: product)),
        ),
      ],
    );
  }

  Widget portraitViewDetail(BuildContext context, Product product) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            image: NetworkImage("${product.img}"),
          ),
        ),
        backDetailsButton(context),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: productDetailsDataWidget(context: context, product: product),
            decoration: BoxDecoration(
              color: slaveColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
