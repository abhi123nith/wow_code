import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:wow_codes/Usefull/Colors.dart';

import '../Config/Config.dart';

class ItemAdapter extends StatefulWidget {
  List Products;
  int list;
  ItemAdapter({super.key, required this.Products, this.list = 0});

  @override
  State<ItemAdapter> createState() => _ItemAdapterState();
}

class _ItemAdapterState extends State<ItemAdapter> {
  int calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1200) {
      return 5; // For wide screens (like large desktops)
    } else if (screenWidth >= 900) {
      return 4; // For medium screens (like tablets in landscape)
    } else if (screenWidth >= 600) {
      return 3; // For smaller tablets
    } else {
      return 2; // For phones and small screens
    }
  }

  @override
  Widget build(BuildContext context) {
    // return GridView.c
    if (widget.list > 0) {
      return (widget.Products.isNotEmpty)
          ? SingleChildScrollView(
              child: Column(
                children: [...widget.Products.map((e) => listItem(data: e))],
              ),
            )
          : Container(
              margin: const EdgeInsets.only(top: 20),
              child: notFound(true, context, Colors.white, "nothing found"));
    } else {
      return (widget.Products.isNotEmpty)
          ? WaterfallFlow.builder(
              itemCount: widget.Products.length,
              //cacheExtent: 0.0,
              padding: const EdgeInsets.all(5.0),
              itemBuilder: (context, i) {
             //   print(widget.Products[i]);
                return item_widget(data: widget.Products[i]);
              },
              gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: calculateCrossAxisCount(context),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                lastChildLayoutTypeBuilder: (index) =>
                    index == widget.Products.length
                        ? LastChildLayoutType.foot
                        : LastChildLayoutType.none,
              ))
          : notFound(true, context, Colors.white, "nothing found");
    }
  }

  @override
  void initState() {
    super.initState();
   // print(widget.Products);
  }
}

class item_widget extends StatefulWidget {
  Map data;
  item_widget({super.key, required this.data});

  @override
  State<item_widget> createState() => _item_widgetState();
}

class _item_widgetState extends State<item_widget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: lightgrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: thumbnailUrl + widget.data['product_image'],
            width: MediaQuery.of(context).size.width * 0.40,
            placeholder: (context, url) =>
                Image.asset("assets/placeholder.jpg"),
          ),
          // Image.network(thumbnailUrl + widget.data['product_image'],width: MediaQuery.of(context).size.width * 0.40,),
          mainTextLeft(widget.data['product_name'], Colors.grey, 13.0,
              FontWeight.normal, 2, "mons"),
          Row(
            children: [
              Expanded(
                  child: mainTextLeft("\$" + widget.data['product_list_price'],
                      Colors.black, 20.0, FontWeight.bold, 1, "mons")),
              IconButton(onPressed: () {}, icon: const Icon(Iconsax.heart))
            ],
          ),
        ],
      ),
    );
  }
}

class listItem extends StatefulWidget {
  Map data;
  listItem({super.key, required this.data});

  @override
  State<listItem> createState() => _listItemState();
}

class _listItemState extends State<listItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.black))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(
            imageUrl: thumbnailUrl + widget.data['product_image'],
            width: MediaQuery.of(context).size.width * 0.20,
            placeholder: (context, url) =>
                Image.asset("assets/placeholder.jpg"),
          ),
          // Image.network(thumbnailUrl + widget.data['product_image'],width: MediaQuery.of(context).size.width * 0.40,),
          Expanded(
              child: mainTextLeft(widget.data['product_name'], Colors.grey,
                  13.0, FontWeight.normal, 2, "mons")),
          const SizedBox(
            width: 10.0,
          ),
          mainTextLeft("\$" + widget.data['product_list_price'], Colors.black,
              20.0, FontWeight.bold, 1, "mons"),
        ],
      ),
    );
  }
}
