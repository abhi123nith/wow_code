import 'package:flutter/material.dart';

import 'Colors.dart';

double borderRadius = 10.0;

class custombtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  double borderRadius;
  double textSize;

  custombtnsss(
      this.title, this.callback, this.main, this.text, this.borderRadius,{super.key, this.textSize = 13.0});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: mainText(title, text, textSize, FontWeight.normal, 1,"mons"),
      ),
    );
  }
}

class newcustombtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  double borderRadius;

  newcustombtnsss(
      this.title, this.callback, this.main, this.text, this.borderRadius, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: mainText(title, text, 15.0, FontWeight.normal, 1,""),
      ),
    );
  }
}

class customborderbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  double borderRadius;

  customborderbtnsss(
      this.title, this.callback, this.main, this.text, this.borderRadius, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: text, width: 2.0)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: mainText(title, text, 13.0, FontWeight.normal, 1,""),
      ),
    );
  }
}

class smallbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  smallbtnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.0),
      height: 20.0,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            foregroundColor: MaterialStateProperty.all<Color>(main),
            backgroundColor: MaterialStateProperty.all<Color>(main),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                    side: BorderSide(color: main)))),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: onlymainText(title, text, 10.0, FontWeight.normal, 1,""),
        ),
      ),
    );
  }
}

class btnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  btnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: mainText(title, text, 13.0, FontWeight.normal, 1,""),
      ),
    );
  }
}

class borderbgbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  double radius;

  borderbgbtnsss(this.title, this.callback, this.main, this.text, this.radius, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: BorderSide(color: text, width: 2.0)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainText(title, text, 13.0, FontWeight.normal, 1,""),
          ],
        ),
      ),
    );
  }
}

class withoutbgbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  double radius;

  withoutbgbtnsss(this.title, this.callback, this.main, this.text, this.radius, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: const BorderSide(color: Colors.black, width: 2.0)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mainText(title, text, 14.0, FontWeight.bold, 1),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_sharp,
              size: 14, // You can change this to any other arrow icon
              color: text, // You can change the color of the arrow icon
            ),
          ],
        ),
      ),
    );
  }

  // Assuming you have a function like this for creating a text widget
  Widget mainText(String title, Color text, double fontSize,
      FontWeight fontWeight, int maxLines) {
    return Text(
      title,
      style: TextStyle(
        color: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class fullbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  fullbtnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          children: [
            const Spacer(),
            mainText(title, text, 13.0, FontWeight.normal, 1,""),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class fullBigbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  fullBigbtnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(main),
            backgroundColor: MaterialStateProperty.all<Color>(main),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: text, width: 2.0)))),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
          child: Row(
            children: [
              const Spacer(),
              mainText(title, text, 15.0, FontWeight.normal, 1,""),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class fullborderbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  Widget icon;

  fullborderbtnsss(this.title, this.callback, this.main, this.text, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: text,
                      width: 1.0,
                    )))),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 5.0,
              ),
              mainText(title, text, 15.0, FontWeight.normal, 1,""),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class fullonlyborderbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  fullonlyborderbtnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: text,
                      width: 1.0,
                    )))),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: [
              const Spacer(),
              mainText(title, text, 15.0, FontWeight.normal, 1,""),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class borderbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  borderbtnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color: text,
                    width: 2.0,
                  )))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: mainText(title, text, 15.0, FontWeight.bold, 1,""),
      ),
    );
  }
}

class pdbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  pdbtnsss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(main),
            backgroundColor: MaterialStateProperty.all<Color>(main),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: main)))),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 3, 5, 3),
          child: Row(
            children: [
              const Spacer(),
              mainText(title.toUpperCase(), text, 13.0, FontWeight.normal, 1,""),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class circularBtn extends StatelessWidget {
  VoidCallback callback;
  IconData i;
  Color main;
  Color text;
  bool mini;

  circularBtn(this.i, this.callback, this.main, this.text, this.mini, {super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: main,
        mini: mini,
        onPressed: callback,
        child: Icon(
          i,
          color: text,
        ));
  }
}

class iconbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  IconData i;
  double r;

  iconbtnsss(this.title, this.callback, this.main, this.text, this.i, this.r, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(r),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          children: [
            const Spacer(),
            Icon(
              i,
              color: text,
            ),
            const SizedBox(
              width: 5.0,
            ),
            onlymainText(title, text, 10.0, FontWeight.bold, 1,""),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class iconleftbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  IconData i;
  double r;

  iconleftbtnsss(this.title, this.callback, this.main, this.text, this.i, this.r, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(r),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        child: Row(
          children: [
            const Spacer(),
            Icon(
              i,
              color: text,
            ),
            const SizedBox(
              width: 10.0,
            ),
            onlymainText(title, text, 13.0, FontWeight.bold, 1,""),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class boardbtnsss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;
  double borderRadius;

  boardbtnsss(
      this.title, this.callback, this.main, this.text, this.borderRadius, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(main),
          backgroundColor: MaterialStateProperty.all<Color>(main),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(color: main)))),
      onPressed: callback,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: mainText(title, text, 13.0, FontWeight.normal, 2,""),
      ),
    );
  }
}
