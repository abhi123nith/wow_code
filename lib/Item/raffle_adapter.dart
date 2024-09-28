import 'package:flutter/material.dart';

class RaffleAdapter extends StatelessWidget {
  final String imageUrl;
  final String nameOfRaffle;
  final String price;
  final String days;
  final String hours;
  final String minutes;
  final String seconds;

  const RaffleAdapter({
    super.key,
    required this.imageUrl,
    required this.nameOfRaffle,
    required this.price,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: const Color(0xFF2e0a26),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.4)),
                ),
                width: orientation == Orientation.portrait
                    ? screenWidth * 0.85 // Portrait mode
                    : screenWidth * 0.65, // Landscape mode
                child: Column(
                  children: [
                    Stack(
                      children: [
                        // Container for product image
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(17),
                              topRight: Radius.circular(16),
                            ),
                            border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.4)),
                            ),
                          ),
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.black87,
                              BlendMode.dstATop,
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(17),
                                topRight: Radius.circular(16),
                              ),
                              child: imageUrl.isNotEmpty
                                  ? Image.network(
                                      imageUrl,
                                      width: orientation == Orientation.portrait
                                          ? screenWidth * 0.85 // Portrait
                                          : screenWidth * 0.85, // Landscape
                                      height:
                                          orientation == Orientation.portrait
                                              ? screenHeight * 0.37
                                              : screenHeight * 0.76,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                        // "Left 385" badge on top left corner of the image
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 27, vertical: 12),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 204, 125, 7),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                              ),
                            ),
                            child: Text(
                              'Left 385',
                              style: TextStyle(
                                letterSpacing: 1.4,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 21 / textScaleFactor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Line of the container
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(17),
                            topRight: Radius.circular(16),
                          ),
                          border: Border(
                            bottom: BorderSide(
                                width: 1, color: Colors.white.withOpacity(0.4)),
                          )),
                    ),
                    const SizedBox(height: 20),
                    // Product name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        nameOfRaffle.isNotEmpty ? nameOfRaffle : 'Loading...',
                        style: TextStyle(
                            wordSpacing: 1.3,
                            letterSpacing: 1.3,
                            color: Colors.white,
                            fontSize: 24 / textScaleFactor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Timer display
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildTimeCard(days, 'Days', textScaleFactor),
                            _buildTimeCard(hours, 'Hours', textScaleFactor),
                            _buildTimeCard(minutes, 'Minutes', textScaleFactor),
                            _buildTimeCard(seconds, 'Seconds', textScaleFactor),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    // Buy button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 221, 139, 15),
                          elevation: 6,
                          shadowColor: Colors.white.withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 42),
                        ),
                        child: Text(
                          price.isNotEmpty
                              ? 'Buy Tickets (\$$price USD)'
                              : 'Loading...',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20 / textScaleFactor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'sans-serif',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 26),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeCard(
      String timeValue, String label, double textScaleFactor) {
    return Card(
      color: Colors.white30,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              timeValue.isNotEmpty ? timeValue : 'Loading...',
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
