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

class Davinci extends StatefulWidget {
  const Davinci({Key? key});

  @override
  State<Davinci> createState() => _DavinciState();
}

class _DavinciState extends State<Davinci> {
  // Sample list of items
  final List<ShopItem> items = [
    ShopItem(
      imagePath: 'lib/images/dav1.jpg',
      name: 'Speed Ramp Effect',
      price: '\$10',
      googleDriveLink: 'https://drive.google.com/drive/folders/1NiVEOJRy6hP0ciFClqFRR7MKCAndmCBg?usp=drive_link', // Example link for item 1
    ),
    ShopItem(
      imagePath: 'lib/images/d22.jpg',
      name: 'Video game Edit',
      price: '\$15',
      googleDriveLink: 'https://drive.google.com/drive/folders/1K1W-abuksUyijq679RbnobFEWScEEG8u?usp=drive_link', // Example link for item 2
    ),
    ShopItem(
      imagePath: 'lib/images/d33.jpg',
      name: 'Text Tracking effect',
      price: '\$20',
      googleDriveLink: 'https://drive.google.com/drive/folders/10LcLyvhVebqT-VMM-J1lnDlTO0SpjIha?usp=drive_link', // Example link for item 3
    ),
    ShopItem(
      imagePath: 'lib/images/d44.jpg',
      name: 'Building Grow Effect',
      price: '\$25',
      googleDriveLink: 'https://drive.google.com/drive/folders/1O7XqrtTnNvQRPZgsYPqpk1yc4UVoduNm?usp=drive_link', // Example link for item 4
    ),
    ShopItem(
      imagePath: 'lib/images/dav2.jpg',
      name: 'Cinematic Lut',
      price: '\$30',
      googleDriveLink: 'https://drive.google.com/drive/folders/1iyuSdW6IjdKV5k9av8bDvA2AUkJ0Ui6W?usp=drive_link', // Example link for item 5
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
      backgroundColor: Colors.yellow[200],
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
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextButton(
                                  onPressed: () => _launchURLInWebView(
                                      item.googleDriveLink),
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

  // Function to launch the URL in a webview
  Future<void> _launchURLInWebView(String url) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Google Drive'),
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      );
    }));
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
    home: Davinci(),
  ));
}
