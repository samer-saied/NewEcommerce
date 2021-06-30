import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/models/products.dart';
import 'package:flutter/material.dart';

Widget productDetailsDataWidget({BuildContext context, Product product}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25, left: 25),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.end,
        children: [
          addCartWidget(),
          titlePriceWidget(product: product, context: context),
          summeryWidget(product: product),
          productDetailsWidget(context: context, product: product),
          SizedBox(
            height: 10,
          ),
          addCartButton(context: context, product: product),
        ],
      ),
    ),
  );
}

Widget addCartWidget() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      height: 55,
      width: 125,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Text(
                "-",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              onTap: () {
                print("-");
              },
            ),
            Text(
              "1",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            InkWell(
              onTap: () {
                print("+");
              },
              child: Text(
                "+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: mainColor, borderRadius: BorderRadius.circular(50)),
    ),
  );
}

Widget titlePriceWidget({Product product, context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "${product.title}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 22),
              ),
            ),
            Text(
              "${product.briefDescription}",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
      //Spacer(),
      priceDetailsWidget(product, context),
    ],
  );
}

Widget priceDetailsWidget(Product product, BuildContext context) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$",
          style: TextStyle(
            fontSize: 16,
            color: mainColor,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          " ${product.price}",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    ),
  );
}

Padding summeryWidget({Product product}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        summeryDetailsWidget(
            summeryIcon: Icons.star_rate_rounded,
            summeryText: "${product.rate}"),
        summeryDetailsWidget(
            summeryIcon: Icons.fireplace_outlined,
            summeryText: "${product.kilocalories} KCal"),
        summeryDetailsWidget(
            summeryIcon: Icons.timer_outlined,
            summeryText: "${product.cookingPeriod}")
      ],
    ),
  );
}

Widget summeryDetailsWidget({String summeryText, IconData summeryIcon}) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          summeryIcon,
          size: 30,
          color: mainColor,
        ),
        Text(
          "$summeryText",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

Widget productDetailsWidget({BuildContext context, Product product}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, bottom: 15),
    child: Text(
      "${product.description}",
      style: TextStyle(
        fontSize: 15,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 4,

      // softWrap: true,
    ),
  );
}

Widget addCartButton({BuildContext context, Product product}) {
  return ElevatedButton(
    onPressed: () {
      print("Add to Cart");
    },
    style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(10.0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                side: BorderSide(color: mainColor))),
        backgroundColor: MaterialStateProperty.all(mainColor)),
    child: Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Center(
        child: Text(
          "Add to Cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
      ),
    ),
  );
}

Widget backDetailsButton(BuildContext context) {
  return Positioned(
      top: 40,
      left: 25,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: slaveColor.withOpacity(0.60),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homeScreen');
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 25,
            )),
      ));
}
