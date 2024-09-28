import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cherry_toast/cherry_toast.dart' as cherry;


Color bgColor = const Color(0xFF0A0A0A);
Color bgColorLight = const Color(0xFF1F1F1F);
Color textColor = const Color(0xFFFFFFFF);

Color lightgrey = const Color(0xFFF6F6F6);

AutoSizeText mainText(String text, Color c, double size, FontWeight w,int lines,String mainFont) {
  return AutoSizeText(
    text,
    textAlign: TextAlign.center,
    maxLines: lines,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFont,
      fontWeight: w,

    ),
  );
}

Text onlymainText(String text, Color c, double size, FontWeight w,int lines,String mainFont) {
  return Text(
    text,
    maxLines: lines,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFont,
      fontWeight: w,
    ),
  );
}


AutoSizeText mainTextLeft(String text, Color c, double size, FontWeight w,int lines,String mainFont) {
  return AutoSizeText(
    text,
    textAlign: TextAlign.start,
    maxLines: lines,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFont,
      fontWeight: w,

    ),
  );
}

Text onlymainTextLeft(String text, Color c, double size, FontWeight w,int lines,String mainFont) {
  return Text(
    text,
    textAlign: TextAlign.start,
    maxLines: lines,
    style: TextStyle(
      color: c,
      letterSpacing: 0.5,
      fontSize: size,
      fontFamily: mainFont,
      fontWeight: w,

    ),
  );
}


class loader extends StatelessWidget {
  String msg;
  loader({super.key,this.msg = "Please Wait..."});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: 100.0,
        width: 100.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.black,
          elevation: 5.0,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




Widget loaderss(bool a,BuildContext context){
  return Visibility(
      visible: a,
      child: Stack(
        children: [
          Visibility(
            visible: a,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
              ),
            ),
          ),
          Visibility(visible: a, child: loader())
        ],
      ));
}

toaster(BuildContext context,String msg){

  cherry.CherryToast(
    themeColor: Colors.black45,
    backgroundColor: bgColor,
    icon: Icons.info_outline,
    shadowColor: Colors.black,
    iconColor: Colors.white,
    title: onlymainText(msg, Colors.white, 13.0
        , FontWeight.bold, 1,"mons"),
    animationDuration: const Duration(milliseconds: 300),
    toastDuration: const Duration(milliseconds: 2000),
  ).show(context);

  // Fluttertoast.showToast(msg: msg,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     textColor: Colors.white,
  //     backgroundColor: mainColor);

}

Widget notFound(bool a,BuildContext context,Color bg,String msg){
  return Visibility(
      visible: a,
      child: Container(alignment: Alignment.center,
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: bg,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/notfound.png",width: MediaQuery.of(context).size.width * 0.50,),
                  mainTextLeft(msg, Colors.black, 10.0, FontWeight.bold, 1,"mons"),
                ],
              ),
            ),
          )
      ));
}


