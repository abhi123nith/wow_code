// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:wow_codes/Config/Config.dart';
// import 'package:wow_codes/Helper/Helper.dart';
// import 'package:wow_codes/Home/search_page.dart';
// import 'package:wow_codes/Usefull/Colors.dart';
// import 'package:wow_codes/Usefull/Functions.dart';

// class HomesPage extends StatefulWidget {
//   const HomesPage({Key? key}) : super(key: key);

//   @override
//   _HomesPageState createState() => _HomesPageState();
// }

// class _HomesPageState extends State<HomesPage> with SingleTickerProviderStateMixin {
//   String searchQuery = "";
//   late TabController _tabController;
//   bool isLoading = false;

//   int currentIndex = 0;
//   Map<String, dynamic> allData = {};
//   Map<String, dynamic> userData = {};
//   Map<String, dynamic> rafflesData = {};

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     setState(() {
//       isLoading = true;
//     });

//     allData = await getLotteryHomeData();
//     userData = await Helper().getUserData();

//     _tabController = TabController(length: allData['categories'].length - 1, vsync: this);

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return allData.isNotEmpty
//         ? DefaultTabController(
//             length: 4,
//             child: Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                   child: NestedScrollView(
//                     headerSliverBuilder: (context, _) {
//                       return [
//                         SliverToBoxAdapter(
//                           child: _buildHeader(),
//                         ),
//                         SliverToBoxAdapter(
//                           child: const SizedBox(height: 20.0),
//                         ),
//                         SliverToBoxAdapter(
//                           child: _buildSearchBar(context),
//                         ),
//                         SliverToBoxAdapter(
//                           child: searchQuery.isEmpty
//                               ? Column(
//                                   children: [
//                                     const SizedBox(height: 20.0),
//                                     _buildCarousel(),
//                                     const SizedBox(height: 10.0),
//                                     _buildCarouselIndicators(),
//                                   ],
//                                 )
//                               : Container(),
//                         ),
//                       ];
//                     },
//                     body: searchQuery.isEmpty
//                         ? Column(
//                             children: [
//                               _buildTabBar(),
//                               const SizedBox(height: 20.0),
//                               Expanded(child: _buildTabBarView()),
//                             ],
//                           )
//                         : _buildSearchResults(),
//                   ),
//                 ),
//                 if (isLoading) _buildLoader(),
//               ],
//             ),
//           )
//         : _buildLoader();
//   }

//   Widget _buildHeader() {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               mainText(
//                 "Hello, ${userData['user_name']}",
//                 Colors.grey,
//                 15.0,
//                 FontWeight.normal,
//                 1,
//                 "mons",
//               ),
//               mainText(
//                 "Welcome Back!",
//                 Colors.black,
//                 20.0,
//                 FontWeight.bold,
//                 1,
//                 "mons",
//               ),
//             ],
//           ),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Iconsax.shopping_cart,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSearchBar(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: SizedBox(
//             height: 50.0,
//             child: TextFormField(
//               onTap: () {
//                 navScreen(SearchPage(Products: allData['products']), context, false);
//               },
//               readOnly: true,
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Iconsax.search_normal, color: Colors.grey),
//                 hintText: "What you need",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(13.0)),
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//               ),
//               onChanged: (text) {
//                 setState(() {
//                   searchQuery = text;
//                 });
//               },
//             ),
//           ),
//         ),
//         const SizedBox(width: 10.0),
//         SizedBox(
//           height: 50.0,
//           child: FloatingActionButton(
//             backgroundColor: Colors.black,
//             onPressed: () {},
//             child: const Icon(Iconsax.heart, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCarousel() {
//     return CarouselSlider(
//       options: CarouselOptions(
//         aspectRatio: MediaQuery.of(context).size.width > 900 ? 5 : 2,
//         autoPlay: true,
//         enlargeCenterPage: true,
//         viewportFraction: MediaQuery.of(context).size.width > 900 ? 0.5 : 1,
//         onPageChanged: (index, reason) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//       ),
//       items: allData['banners'].map<Widget>((e) {
//         return CarouselItem(
//           data: e);
//       }).toList(),
//     );
//   }

//   Widget _buildCarouselIndicators() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: allData['banners'].asMap().entries.map<Widget>((entry) {
//         return GestureDetector(
//           onTap: () => _onDotTap(entry.key),
//           child: Container(
//             width: 8.0,
//             height: 8.0,
//             margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: currentIndex == entry.key ? Colors.black : Colors.grey,
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildTabBar() {
//     return Container(
//       padding: const EdgeInsets.only(top: 10),
//       width: MediaQuery.of(context).size.width,
//       child: TabBar(
//         controller: _tabController,
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.grey,
//         isScrollable: true,
//         indicatorColor: Colors.white,
//         tabs: allData['raffles']
//             .where((e) => e['raffle_id'] != "0")
//             .map<Widget>((e) {
//           int c = int.parse(e['raffle_id']);
//           return TabBarItem(
//             callback: () => changeSelectedTab(c),
//             data: e,
//             mainColor: Colors.black,
//             textColor: Colors.white,
//             radius: 30,
//             isSelected: _tabController.index == c,
//           );
//         }).toList(),
//       ),
//     );
//   }

//   Widget _buildTabBarView() {
//     return TabBarView(
//       controller: _tabController,
//       physics: const NeverScrollableScrollPhysics(),
//       children: allData['categories']
//           .where((e) => e['category_id'] != "1")
//           .map<Widget>((e) {
//         return Container(); // Add your content here
//       }).toList(),
//     );
//   }

//   Widget _buildSearchResults() {
//     return Column(
//       children: [
//         Expanded(
//           child: Container(), // Add search result handling here
//         ),
//       ],
//     );
//   }

//   void _onDotTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   Widget _buildLoader() {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   void changeSelectedTab(int index) {
//     setState(() {
//       _tabController.animateTo(index, duration: const Duration(milliseconds: 100));
//     });
//   }
// }

// class TabBarItem extends StatelessWidget {
//   final VoidCallback callback;
//   final Map<String, dynamic> data;
//   final Color mainColor;
//   final Color textColor;
//   final double radius;
//   final bool isSelected;

//   const TabBarItem({
//     Key? key,
//     required this.callback,
//     required this.data,
//     required this.mainColor,
//     required this.textColor,
//     required this.radius,
//     required this.isSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return (isSelected)
//         ? AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             height: 40.0,
//             padding: EdgeInsets.only(right: isSelected ? 10.0 : 0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(radius),
//                 ),
//                 backgroundColor: Colors.transparent,
//                 shadowColor: Colors.transparent,
//               ),
//               onPressed: callback,
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: textColor,
//                     child: Image.network(thumbnailUrl + data['category_image']),
//                   ),
//                   const SizedBox(width: 5),
//                   if (isSelected)
//                     Text(
//                       data['category_name'],
//                       style: TextStyle(color: textColor),
//                     ),
//                 ],
//               ),
//             ),
//           )
//         : FloatingActionButton(
//             mini: true,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(50.0),
//             ),
//             backgroundColor: mainColor,
//             onPressed: callback,
//             child: CircleAvatar(
//               backgroundColor: textColor,
//               child: Image.network(thumbnailUrl + data['category_image']),
//             ),
//           );
//   }
// }
