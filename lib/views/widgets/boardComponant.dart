import 'package:ecommerceproject/const/appConst.dart';
import 'package:ecommerceproject/models/board.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool isLast = false;
PageController controller = PageController();

Widget getBoardScreen({
  @required BuildContext context,
  @required List<Board> boardList,
}) {
  return PageView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: boardList.length,
    onPageChanged: (index) {
      print(index);
      if (index == boardList.length - 1) {
        isLast = true;
      } else {
        isLast = false;
      }
    },
    controller: controller,
    itemBuilder: (context, int) {
      return boardPageWidget(context, boardList[int], boardList.length);
    },
  );
}

Widget boardPageWidget(
  BuildContext context,
  Board board,
  int countBoard,
) {
  return Scaffold(
    backgroundColor: backColor,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image(
            image: AssetImage(board.imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    board.textLineOne,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        board.fristWordLineTwo,
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        board.secandWordLineTwo,
                        style: TextStyle(
                            color: mainColor,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 50,
                      right: 50,
                      top: 10,
                    ),
                    child: Text(
                      board.detailsText,
                      style: TextStyle(
                        letterSpacing: 1.1,
                        color: blackColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MediaQuery.of(context).size.height > 400
                      ? SizedBox(
                          height: 30,
                        )
                      : SizedBox(
                          height: 10,
                        ),
                  pageIndecator(countBoard),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(context, buttonFuncation, board.buttonText)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget pageIndecator(int countBoard) {
  return SmoothPageIndicator(
    controller: controller,
    count: countBoard,
    effect: ExpandingDotsEffect(
      dotColor: slaveColor,
      activeDotColor: mainColor,
      radius: 8,
      spacing: 10,
    ),
  );
}

Widget customButton(context, buttonFunc, buttonText) {
  return ElevatedButton(
    onPressed: () {
      buttonFunc(context);
    },
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: mainColor))),
        backgroundColor: MaterialStateProperty.all(mainColor)),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 35,
        right: 35,
        top: 10,
        bottom: 10,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}

void buttonFuncation(context) {
  if (isLast) {
    Navigator.of(context).pushReplacementNamed("/loginScreen");
  } else {
    controller.nextPage(
        duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }
}
