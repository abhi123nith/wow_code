import 'package:flutter/material.dart';
import 'package:wow_codes/Ticket/ticket_purchase_screen.dart';

class RaffleScreen extends StatefulWidget {
  const RaffleScreen({super.key});

  @override
  State<RaffleScreen> createState() => _RaffleScreenState();
}

class _RaffleScreenState extends State<RaffleScreen> {
  int currentPage = 0;

  final List<String> images = [
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph',
    'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph',
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: const Color(0xFF2e0a26),
      appBar: AppBar(
        title: const Text(
          'Apple Watch',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
        backgroundColor: const Color(0xFF7c4037),
      ),
      body: Center(
        child: ListView(
          children: [
            // Timer Section
            Container(
              color: const Color.fromARGB(68, 20, 44, 255),
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(vertical: 9),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTimeCard('140', 'Days', 1),
                      _buildTimeCard('06', 'Hours', 1),
                      _buildTimeCard('33', 'Minutes', 1),
                      _buildTimeCard('32', 'Seconds', 1),
                    ],
                  ),
                ),
              ),
            ),

            // Image Section with Scrollable Dots
            Container(
              width: screenSize.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  //  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: isPortrait
                          ? screenSize.height * 0.25
                          : screenSize.width * 0.25,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: images.length,
                        onPageChanged: (int index) {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.network(
                            images[index],
                            //  width: double.infinity,
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          images.length,
                          (index) => dotIndicator(index == currentPage),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Prizes Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 12),
                  child: Text(
                    'Prizes',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        prizeCard('Apple Watch', 'for 1 winner', '\$499',
                            'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph'),
                        prizeCard('Airpods', 'for 1 winner', '\$299',
                            'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-pro-2-hero-select-202409?wid=890&hei=890&fmt=jpeg&qlt=90&.v=1724041669458'),
                        prizeCard('Apple Watch', 'for 1 winner', '\$499',
                            'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph'),
                        prizeCard('Airpods', 'for 1 winner', '\$299',
                            'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-pro-2-hero-select-202409?wid=890&hei=890&fmt=jpeg&qlt=90&.v=1724041669458'),
                        prizeCard('Apple Watch', 'for 1 winner', '\$499',
                            'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQNP637_SdjGj16HBRkzV4aevtlC2zwQl0plQgRKe0ns7jhstE0WPyb3qaIMAdJlx77Yu6aAcQQQwuBiiY6Vcqh4AarFL0IYD8-FKzMc8ewua1-eUhIvHph'),
                        prizeCard('Airpods', 'for 1 winner', '\$299',
                            'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/airpods-pro-2-hero-select-202409?wid=890&hei=890&fmt=jpeg&qlt=90&.v=1724041669458'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Ticket Info Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: const Color.fromARGB(68, 20, 44, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('9',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('Total Sold',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('400',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      LinearProgressIndicator(
                        minHeight: 14,
                        value: 9 / 400,
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                        backgroundColor: Colors.white30,
                      ),
                      const SizedBox(height: 10),
                      const Text('391 Tickets remaining',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),

            // Buy Tickets Button (Reduced width)
            Center(
              child: Card(
                color: const Color.fromARGB(68, 20, 44, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                  child: SizedBox(
                    width: screenSize.width * 0.45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TicketPurchaseScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.orange,
                        elevation: 6,
                        shadowColor: Colors.white.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                      child: const Text(
                        'Buy Tickets',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          wordSpacing: 1.2,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(
      String timeValue, String label, double textScaleFactor) {
    return Card(
      color: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        child: Column(
          children: [
            Text(
              timeValue,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24 / textScaleFactor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14 / textScaleFactor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dot Indicator
Widget dotIndicator(bool isActive) {
  return Container(
    margin: const EdgeInsets.all(4.0),
    width: isActive ? 12 : 8,
    height: isActive ? 12 : 8,
    decoration: BoxDecoration(
      color: isActive ? Colors.black : Colors.grey,
      shape: BoxShape.circle,
    ),
  );
}

// Prize Card
Widget prizeCard(
    String prize, String description, String price, String imageUrl) {
  return Card(
    color: const Color.fromARGB(68, 20, 44, 255),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(prize,
              style: const TextStyle(fontSize: 18, color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 0),
          child: Container(
            width: 117,
            color: Colors.white30,
            child: Text(description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
        ),
        Container(
          width: 117,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Text("worth $price",
            style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
