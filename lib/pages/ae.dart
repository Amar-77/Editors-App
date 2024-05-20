import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Custom data model to represent an item with an image and its details
class ShopItem {
  final String imagePath;
  final String name;
  final String price;
  final String googleDriveLink; // New property for Google Drive link

  ShopItem({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.googleDriveLink, // Initialize with the Google Drive link
  });
}

class After extends StatefulWidget {
  const After({Key? key});

  @override
  State<After> createState() => _AfterState();
}

class _AfterState extends State<After> {
  // Sample list of items
  final List<ShopItem> items = [
    ShopItem(
      imagePath: 'lib/images/ae1.jpg',
      name: 'Zoom Transition',
      price: '\$10',
      googleDriveLink: 'https://drive.google.com/drive/folders/1Jk9EolfAaBMNYUbGXVNlp79dhjnxlWGz?usp=drive_link', // Example link for item 1
    ),
    ShopItem(
      imagePath: 'lib/images/ae2.jpg',
      name: 'Flicker effect',
      price: '\$15',
      googleDriveLink: 'https://drive.google.com/drive/folders/1xmmlnkq-ptsY_8XLPxhwhmqjahmIhZPD?usp=drive_link', // Example link for item 2
    ),
    ShopItem(
      imagePath: 'lib/images/ae3.jpg',
      name: 'Stretch effect',
      price: '\$20',
      googleDriveLink: 'https://drive.google.com/drive/folders/1uwGwnB5Wo9-TUd4P69RNpFp8oZ1-DITE?usp=drive_link', // Example link for item 3
    ),
    ShopItem(
      imagePath: 'lib/images/ae4.jpg',
      name: 'Black & White Lut',
      price: '\$25',
      googleDriveLink: 'https://drive.google.com/drive/folders/1DAC3exKeKbAbbNW1TW-earfKYZoN-Zap?usp=drive_link', // Example link for item 4
    ),
    ShopItem(
      imagePath: 'lib/images/ae5.jpg',
      name: 'Film-Making Lut',
      price: '\$30',
      googleDriveLink: 'https://drive.google.com/drive/folders/1JsrbP_vfyhMuBXqEqmgeVr2b3yPDEnxv?usp=drive_link', // Example link for item 5
    ),
  ];

  // Filtered list based on search query
  List<ShopItem> filteredItems = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems.addAll(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove app bar shadow
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              filteredItems = items
                  .where((item) =>
                  item.name.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              searchController.clear();
              setState(() {
                filteredItems.clear();
                filteredItems.addAll(items);
              });
            },
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      backgroundColor: Colors.deepPurpleAccent.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            final item = filteredItems[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Card(
                elevation: 3, // Add card elevation for a raised effect
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)), // Rounded corners for top of image
                              child: Image.asset(
                                item.imagePath,
                                width: double.infinity, // Image width takes full width of the card
                                height: 250, // Fixed height for the image
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.7),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 3,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    item.price,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Implement cart functionality here
                                // For example, you can add the item to a shopping cart
                                // Or navigate to a cart screen
                              },
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 8), // Spacer between name and price
                              GestureDetector(
                                onTap: () => _openDriveLink(item.googleDriveLink),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'DOWNLOAD',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 40, // Adjust the position slightly up
                      right: 12,
                      child: FavoriteButton(), // Use the custom favorite button widget
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to open the Google Drive link
  void _openDriveLink(String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorite ? Icons.favorite : Icons.favorite_border,
        color: _isFavorite ? Colors.red : null, // Change color to red when it's a favorite
      ),
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite; // Toggle favorite status
        });
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: After(),
  ));
}
