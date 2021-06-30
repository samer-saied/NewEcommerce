import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/models/category.dart';
import 'package:ecommerceproject/models/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'appComponant.dart';

Widget customEleventButton({@required String imageUrl, bool svgImage = false}) {
  return MaterialButton(
    onPressed: () {},
    child: Container(
      width: 25,
      height: 35,
      child: svgImage
          ? SvgPicture.asset(
              imageUrl,
              height: 20,
              width: 20,
            )
          : Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 20,
              width: 20,
            ),
    ),
  );
}

Widget locationTextWidget({@required context, @required String locationText}) =>
    Expanded(
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.mapMarkerAlt,
              color: mainColor,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                locationText,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            FaIcon(
              FontAwesomeIcons.caretDown,
              color: mainColor,
              size: 20,
            ),
          ],
        ),
      ),
    );

Widget topBanner(context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customEleventButton(
              imageUrl: "assets/svg/ellipsisvsolid.svg", svgImage: true),
          locationTextWidget(context: context, locationText: "California,US"),
          customEleventButton(imageUrl: "assets/images/avatarnick.png")
        ],
      ),
    );

Widget sliderBanner({@required List<dynamic> items}) => CarouselSlider(
      items: items
          .map(
            (element) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  //color: mainColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: AssetImage(
                    "assets/images/image-loading.gif",
                  ),
                  image: NetworkImage(
                    "${element.imageUrl}",
                  ),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );

Widget viewAllText({@required context, @required String categoryText}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            categoryText,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: mainColor,
            ),
            child: Icon(
              Icons.chevron_right_rounded,
              color: slaveColor,
              size: 18,
            ),
          )
        ],
      ),
    );

Widget categoryIconsList() {
  int currentIndex = 0;
  List<Category> categories = [
    Category(1, "Burger", "Burger",
        "https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80"),
    Category(2, "Pizza", "Burger",
        "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
    Category(3, "Meat", "Burger",
        "https://images.unsplash.com/photo-1603048374877-b98f840ad441?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80"),
    Category(4, "Chicken", "Burger",
        "https://images.unsplash.com/photo-1598103442097-8b74394b95c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80")
  ];

  return Container(
    height: 60,
    child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: (currentIndex == index) ? mainColor : slaveColor,
                  borderRadius: BorderRadius.circular(50.0)),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  currentIndex = index;

                  print(currentIndex);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: mainColor,
                      backgroundImage: NetworkImage(categories[index].logoUrl),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      categories[index].name,
                      style: (currentIndex == index)
                          ? Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: whiteColor)
                          : Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

Widget titleTextWithViewAll({@required context}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleText(context: context, text: 'Popular Now'),
        viewAllText(context: context, categoryText: "View All")
      ],
    );

Widget productGridTitle({
  @required context,
  @required Product product,
}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(
        context,
        '/detailScreen',
        arguments: product,
      );
    },
    child: Container(
      width: 175,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20)],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
            child: Image(
              width: 175,
              height: 160,
              fit: BoxFit.fill,
              image: NetworkImage(product.img),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              product.title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Text(
              product.description,
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$ ",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: mainColor),
                  ),
                  Text(
                    product.price,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget productGridList(List<Product> products) {
  return Container(
    height: 350,
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: productGridTitle(
            context: context,
            product: products[index],
          ),
        );
      },
    ),
  );
}
