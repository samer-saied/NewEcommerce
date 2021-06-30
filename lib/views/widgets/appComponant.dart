import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/cubit/ecommercecubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget getNavBar() {
  return BlocConsumer<EcommerceCubit, EcommerceState>(
    listener: (context, state) {},
    builder: (context, state) {
      var ecommerceCubit = EcommerceCubit().get(context);
      int index = ecommerceCubit.index;

      return BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            tooltip: 'Home',
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            tooltip: 'Favorite',
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            tooltip: 'notification',
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            tooltip: 'cart',
            label: 'Cart',
          ),
        ],
        currentIndex: index,
        selectedItemColor: mainColor,
        unselectedItemColor: assistColor,
        elevation: 0.0,
        iconSize: 24.0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: IconThemeData(size: 34, color: mainColor),
        onTap: (selectedNavItem) {
          ecommerceCubit.changeIndex(selectedNavItem);
        },
      );
    },
  );
}

Widget titleText({@required context, @required String text}) => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                  //  color: mainColor,
                ),
          ),
        ),
      ],
    );

Widget defaultTextField(
    {TextEditingController controller,
    bool obscureText = false,
    TextInputType keyboardType,
    String labelText,
    IconData prefixIcon,
    IconData suffixIcon,
    String hintText,
    String validateText,
    bool suffixIconAvailable = false,
    BuildContext context}) {
  return TextFormField(
    obscureText: obscureText,
    keyboardType: keyboardType,
    controller: controller,
    style: Theme.of(context).textTheme.bodyText1,
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: blackColor),
            borderRadius: BorderRadius.circular(20)),
        labelText: labelText,
        labelStyle:
            Theme.of(context).textTheme.headline6.copyWith(fontSize: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: blackColor,
        ),
        suffixIcon: suffixIconAvailable
            ? Icon(
                suffixIcon,
                color: blackColor,
              )
            : null,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return validateText.toString();
      }
      return null;
    },
  );
}

Widget defaultButtonWidget(
    {@required String buttonText, @required Function buttonFunc}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: ElevatedButton(
      onPressed: buttonFunc,
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
            buttonText,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    ),
  );
}

Widget textButtonWidget(
    {@required Color textButtonColor,
    @required String textButtontxt,
    @required Function buttonFunc}) {
  return TextButton(
    //style: ButtonStyle(shadowColor: MaterialStateProperty.all(mainColor)),
    onPressed: () {},
    child: Text(
      textButtontxt,
      style: TextStyle(color: textButtonColor),
    ),
  );
}

Widget imageButtonWidget(
    {@required String buttonImage,
    @required Function buttonFunc,
    @required Color buttonColor}) {
  return MaterialButton(
    onPressed: buttonFunc,
    child: Image(
      image: AssetImage(buttonImage),
      fit: BoxFit.contain,
      height: 40,
      width: 40,
    ),
  );
}
