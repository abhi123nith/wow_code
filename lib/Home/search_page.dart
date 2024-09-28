import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wow_codes/Helper/Helper.dart';
import 'package:wow_codes/Home/OneSearchPage.dart';
import 'package:wow_codes/Home/item_adapter.dart';
import 'package:wow_codes/Usefull/Colors.dart';
import 'package:wow_codes/Usefull/Functions.dart';

class SearchPage extends StatefulWidget {
  List Products;
  SearchPage({super.key, required this.Products});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String search = "";
  List serches = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    serches = await Helper().getrecentSearch();

    setState(() {});
    print(serches);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        // leading: Container(),
        // leadingWidth: 0.0,
        title: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: false,
                maxLength: 128,
                keyboardType: TextInputType.text,
                cursorColor: Colors.black,
                style: const TextStyle(
                  fontFamily: 'pop',
                  fontSize: 13.0,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                    // suffixIcon: (search.isNotEmpty)?IconButton(onPressed: (){}, icon: Icon(Icons.close,color: Colors.grey,)):Container(),
                    filled: false,
                    counterText: "",
                    prefixIcon: Icon(
                      Iconsax.search_normal,
                      color: Colors.grey,
                    ),
                    hintText: "Search Product Brand",
                    hintStyle: TextStyle(fontFamily: 'pop', color: Colors.grey),
                    errorStyle:
                        TextStyle(fontFamily: 'mons', color: Colors.redAccent),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.redAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide:
                            BorderSide(color: Colors.grey, width: 0.5))),
                onChanged: (text) {
                  setState(() {
                    search = text;
                  });
                },
                validator: (value) {
                  return null;
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            (search.isNotEmpty)
                ? SizedBox(
                    height: 50.0,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      backgroundColor: Colors.black,
                      onPressed: () {
                        navScreen(
                            OneSearchPage(
                                Products: widget.Products, search: search),
                            context,
                            false);
                        Helper().setRecentSearch(search);
                      },
                      child: const Icon(
                        Iconsax.search_normal,
                        color: Colors.white,
                      ),
                    ))
                : Container(),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (search.isNotEmpty)
                    ? ItemAdapter(
                        Products: widget.Products.where((ee) =>
                            ee['product_name']
                                .toString()
                                .toLowerCase()
                                .contains(search.toLowerCase())).toList(),
                        list: (search.isEmpty) ? 1 : 2,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          onlymainTextLeft("Recent search History",
                              Colors.black, 15.0, FontWeight.normal, 1, 'mons'),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 10.0,
                            runSpacing: 10.0,
                            children: [
                              ...serches.map((e) => smallbtnss(e, () {
                                    navScreen(
                                        OneSearchPage(
                                            Products: widget.Products,
                                            search: e),
                                        context,
                                        false);
                                  }, lightgrey, Colors.black))
                            ],
                          )
                        ],
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class smallbtnss extends StatelessWidget {
  VoidCallback callback;
  String title;
  Color main;
  Color text;

  smallbtnss(this.title, this.callback, this.main, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(main),
            backgroundColor: WidgetStateProperty.all<Color>(main),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: main)))),
        onPressed: callback,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
          child: mainText(title, text, 13.0, FontWeight.normal, 1, "mons"),
        ),
      ),
    );
  }
}
