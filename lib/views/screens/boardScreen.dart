import 'package:ecommerceproject/models/board.dart';
import 'package:ecommerceproject/views/widgets/boardComponant.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Board> boardList = [
      Board(
          "Next ... ",
          " The Great Taste Awards are hosted every year by the Guild of Fine Foods. It is their flagship competition, the world's largest and most trusted",
          "Great Taste",
          "Bold",
          "assets/images/board1.png",
          "Flavors"),
      Board(
          "Next ... ",
          "100% pure beef patties free of any additives, only a pinch of salt and pepper is added",
          "Real Ingredients",
          "Fresh & ",
          "assets/images/board2.png",
          "Pure"),
      Board(
        "Get Started",
        " from oven to your home with Hot with fresh Flavour",
        "Fast Delivery",
        "",
        "assets/images/board3.png",
        "For you",
      ),
    ];
    return getBoardScreen(boardList: boardList, context: context);
  }
}
