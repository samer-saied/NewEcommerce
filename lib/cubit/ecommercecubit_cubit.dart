import 'package:bloc/bloc.dart';
import 'package:ecommerceproject/models/banner.dart';
import 'package:ecommerceproject/models/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'ecommercecubit_state.dart';

class EcommerceCubit extends Cubit<EcommerceState> {
  EcommerceCubit() : super(EcommerceInitial());

  EcommerceCubit get(context) => BlocProvider.of(context);

  /////////////////////////////////   Banner      ///////////////////////////////////

  List<Banner> getBanneritems = [
    Banner(
        1,
        "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
        1),
    Banner(
        2,
        "https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        1),
    Banner(
        3,
        "https://images.unsplash.com/photo-1607082349566-187342175e2f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        1),
    Banner(
        4,
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
        1),
  ];

  /////////////////////////////////   Product      ///////////////////////////////////
  List<Product> products = [
    Product(
        1,
        "Beef Burger",
        "Pure Beef Burger",
        "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]",
        "6.59",
        "https://images.unsplash.com/photo-1603064752734-4c48eff53d05?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
        "4.5",
        150,
        "5 - 10 Min"),
    Product(
        2,
        "Double Burger",
        "Double slice of Beef Burger",
        "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]",
        "7.49",
        "https://images.unsplash.com/photo-1553979459-d2229ba7433b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=962&q=80",
        "4.8",
        250,
        "5 - 10 Min"),
    Product(
        3,
        "cheesy Burger",
        "Beef Burger with cheese",
        "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]",
        "8.49",
        "https://images.unsplash.com/photo-1595531172949-30922c28a240?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
        "4.9",
        260,
        "7 - 12 Min"),
    Product(
        4,
        "Mexx Burger",
        "Beef Burger with Onion and Cheese",
        "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]",
        "8.49",
        "https://images.unsplash.com/photo-1603893662172-99ed0cea2a08?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80",
        "4.6",
        175,
        "7 - 10 Min"),
    Product(
        5,
        "Chicken Burger",
        "Chicken Burger with Onion and tomato",
        "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]",
        "5.89",
        "https://images.unsplash.com/photo-1609167921669-4561a5b64e28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
        "4.6",
        150,
        "7 - 10 Min"),
    Product(
        6,
        "Burger",
        "Chicken Burger with Onion and tomato",
        "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chiles; condiments such as ketchup, mustard, mayonnaise, relish, or a 'special sauce', often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger topped with cheese is called a cheeseburger.[1]",
        "5.89",
        "https://images.unsplash.com/photo-1609167921669-4561a5b64e28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
        "4.6",
        150,
        "7 - 10 Min"),
  ];

  ////////////////////////////////////NavBar ////////////////////////////////////
  ///
  ///
  int index = 0;
  void changeIndex(int value) {
    index = value;
    print(value);
    emit(ChangeNavBarIndexState());
  }
}
