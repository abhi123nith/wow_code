import 'package:flutter/material.dart';

class TicketPurchaseScreen extends StatefulWidget {
  const TicketPurchaseScreen({super.key});

  @override
  _TicketPurchaseScreenState createState() => _TicketPurchaseScreenState();
}

class _TicketPurchaseScreenState extends State<TicketPurchaseScreen> {
  int selectedCategoryIndex = 0;
  List<Set<int>> selectedNumbersByCategory = List.generate(4, (_) => {});

  Set<int> bookedNumbers = {17, 18, 50, 75}; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e0a26),
      appBar: AppBar(
        title: const Text(
          'Apple Watch',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
         icon: const Icon( Icons.arrow_back_outlined,
          color: Colors.white,
          size: 28,
         ),
        ),
        backgroundColor: const Color(0xFF7c4037),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          int startNumber = selectedCategoryIndex * 100 + 1;
          int endNumber = startNumber + 99;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Category Tabs
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: const Color.fromARGB(68, 20, 44, 255),
                          padding: const EdgeInsets.all(8.0),
                          height: 60,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildCategoryTab("1 - 100", 0),
                              _buildCategoryTab("101 - 200", 1),
                              _buildCategoryTab("201 - 300", 2),
                              _buildCategoryTab("301 - 400", 3),
                            ],
                          ),
                        ),
                      ),

                      // Number Grid
                      SizedBox(
                        width: screenWidth * 0.88, 
                        height: 400, 
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth > 600 ? 8 : 6,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 1.5,
                          ),
                          itemCount: endNumber - startNumber + 1,
                          itemBuilder: (context, index) {
                            int number = startNumber + index;
                            return _buildGridItem(number);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Selected Numbers and Buy Section
              _buildSelectedNumbersSection(screenWidth),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryTab(String title, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: selectedCategoryIndex == index
              ? Colors.orange
              : Colors.white30,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          setState(() {
            selectedCategoryIndex = index;
          });
        },
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(int number) {
    bool isSelected = selectedNumbersByCategory[selectedCategoryIndex].contains(number);
    bool isBooked = bookedNumbers.contains(number); 

    return GestureDetector(
      onTap: () {
        if (isBooked) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('This number is already booked!'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
            ),
          );
        } else {
          setState(() {
            if (isSelected) {
              selectedNumbersByCategory[selectedCategoryIndex].remove(number);
            } else {
              selectedNumbersByCategory[selectedCategoryIndex].add(number);
            }
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isBooked
              ? Colors.red // Booked seats appear red
              : isSelected
                  ? Colors.green
                  : Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          number.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildSelectedNumbersSection(double screenWidth) {
    Set<int> selectedNumbers = selectedNumbersByCategory[selectedCategoryIndex];
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white.withOpacity(0.9)),
          color: Colors.purple.shade800,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Your Selected Numbers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: selectedNumbers.map((number) => _buildSelectedNumber(number)).toList(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buy ${selectedNumbers.isEmpty ? 1 : selectedNumbers.length} Numbers',
                      style: const TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'for \$${selectedNumbers.isEmpty ? 10 : selectedNumbers.length * 10}',
                      style: const TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Card(
                  color: const Color.fromARGB(68, 20, 44, 255),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SizedBox(
                      width: screenWidth * 0.35,
                      child: ElevatedButton(
                        onPressed: () {
                          // Implement buy tickets functionality
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          backgroundColor: Colors.orange,
                          elevation: 6,
                          shadowColor: Colors.white.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(vertical: 9),
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
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedNumber(int number) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}
