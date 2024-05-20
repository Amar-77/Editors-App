import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ShopItem {
  final String imagePath;
  final String name;
  final String price;
  final String googleDriveLink;

  ShopItem({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.googleDriveLink,
  });
}

class PhShop extends StatefulWidget {
  const PhShop({Key? key});

  @override
  State<PhShop> createState() => _PhShopState();
}

class _PhShopState extends State<PhShop> {

  final List<ShopItem> items = [
    ShopItem(
      imagePath: 'lib/images/pic1.jpg',
      name: 'Mirror Effect',
      price: '\$10',
      googleDriveLink: 'https://drive.google.com/drive/folders/15V-2Ew7jdo5EWL_z5opnRDUTGOoua--q?usp=drive_link',
    ),
    ShopItem(
      imagePath: 'lib/images/pic222.jpg',
      name: 'Wedding grades',
      price: '\$15',
      googleDriveLink: 'https://drive.google.com/drive/folders/1q3DWOUJC6Fo3dYHMaBJmOvURa8B9RNgy?usp=drive_link',
    ),
    ShopItem(
      imagePath: 'lib/images/pic3.jpg',
      name: 'Aesthetic grades',
      price: '\$20',
      googleDriveLink: 'https://drive.google.com/drive/folders/1ovTO0TIOl8Ba8lrk_9TPpP1haLZi3RUB?usp=drive_link',
    ),
    ShopItem(
      imagePath: 'lib/images/pic4.jpg',
      name: 'VFX pack',
      price: '\$25',
      googleDriveLink: 'https://drive.google.com/drive/folders/13crTgLDEBrxrhGb4DpCk3BvwO6Nf-VW9?usp=drive_link',
    ),
    ShopItem(
      imagePath: 'lib/images/pic5.jpg',
      name: 'Colour Changer',
      price: '\$30',
      googleDriveLink: 'https://drive.google.com/drive/folders/1U6KtqghYj8J9EcFMz8y-5RqQY80o8XLm?usp=drive_link',
    ),
  ];


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
      backgroundColor: Colors.blue.shade100,
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
                                  top: Radius.circular(16)),
                              child: Image.asset(
                                item.imagePath,
                                width: double.infinity,
                                height: 250,
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
                                      offset: Offset(0, 2),
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
                                onTap: () =>
                                    _launchURLInWebView(item.googleDriveLink),
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
    home: PhShop(),
  ));
}
