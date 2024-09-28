import 'package:flutter/material.dart';
import 'package:wow_codes/Home/item_adapter.dart';
import 'package:wow_codes/Usefull/Colors.dart';

class OneSearchPage extends StatefulWidget {
  List Products;
  String search;
  OneSearchPage({super.key, required this.Products, required this.search});

  @override
  State<OneSearchPage> createState() => _OneSearchPageState();
}

class _OneSearchPageState extends State<OneSearchPage> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: mainTextLeft(
            widget.search, Colors.black, 15.0, FontWeight.normal, 1, "mons"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainTextLeft(
                widget.Products.where((ee) => ee['product_name']
                            .toString()
                            .toLowerCase()
                            .contains(widget.search.toLowerCase()))
                        .toList()
                        .length
                        .toString() +
                    " " +
                    widget.search +
                    " " +
                    "found",
                Colors.black,
                15.0,
                FontWeight.normal,
                1,
                'mons'),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
                child: ItemAdapter(
                    Products: widget.Products.where((ee) => ee['product_name']
                        .toString()
                        .toLowerCase()
                        .contains(widget.search.toLowerCase())).toList())),
          ],
        ),
      ),
    );
  }
}
