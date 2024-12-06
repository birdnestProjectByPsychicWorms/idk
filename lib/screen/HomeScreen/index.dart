import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1; // Default index for Home
  int _currentSectionIndex = 0; // Index for sections within the Home tab
  final List<Product> favorites = []; // Shared favorites list

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define sections for the "Home" tab
    final sections = [
      _buildHomeScreenContent(screenWidth),
      _buildProductSection(screenWidth),
    ];

    // Define main screens for bottom navigation
    final screens = [
      _buildFavoriteScreen(),
      IndexedStack(index: _currentSectionIndex, children: sections), // Home tab
      _buildPlaceholderScreen("Chart"),
      _buildPlaceholderScreen("Profile"),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // HomeScreen Content Section
  Widget _buildHomeScreenContent(double screenWidth) {
    final double fontSize = screenWidth * 0.045;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and Notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text(
                      'John William',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    size: screenWidth * 0.07,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.04),
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,
                    color: Colors.grey, size: screenWidth * 0.06),
                hintText: 'Search here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.08),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding:
                    EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              ),
            ),
            SizedBox(height: screenWidth * 0.04),
            // Cards Section
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _buildCard(
                    imagePath: 'assets/images/bed.png',
                    title: 'Beds',
                    screenWidth: screenWidth,
                    onTap: () {
                      setState(() {
                        _currentSectionIndex = 1; // Show Product Section
                      });
                    },
                  ),
                  _buildCard(
                    imagePath: 'assets/images/sofa.png',
                    title: 'Sofas',
                    screenWidth: screenWidth,
                    onTap: () {
                      setState(() {
                        _currentSectionIndex = 1; // Show Product Section
                      });
                    },
                  ),
                  _buildCard(
                    imagePath: 'assets/images/table.png',
                    title: 'Tables',
                    screenWidth: screenWidth,
                    onTap: () {
                      setState(() {
                        _currentSectionIndex = 1; // Show Product Section
                      });
                    },
                  ),
                  _buildCard(
                    imagePath: 'assets/images/chair.png',
                    title: 'Chairs',
                    screenWidth: screenWidth,
                    onTap: () {
                      setState(() {
                        _currentSectionIndex = 1; // Show Product Section
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Product Section
  Widget _buildProductSection(double screenWidth) {
    final products = [
      Product(
          name: "Seleemon",
          price: "4,999,900 ₮",
          imageUrl: "assets/images/product1.png"),
      Product(
          name: "Xiya",
          price: "3,799,900 ₮",
          imageUrl: "assets/images/product2.png"),
      Product(
          name: "Rylone",
          price: "5,499,900 ₮",
          imageUrl: "assets/images/product3.png"),
      Product(
          name: "Fizura",
          price: "2,999,900 ₮",
          imageUrl: "assets/images/product4.png"),
      Product(
          name: "Corma",
          price: "6,299,900 ₮",
          imageUrl: "assets/images/product5.png"),
      Product(
          name: "Bendro",
          price: "4,299,900 ₮",
          imageUrl: "assets/images/product6.png"),
    ];

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 600 ? 3 : 2,
          childAspectRatio: screenWidth > 600 ? 0.75 : 0.8,
          crossAxisSpacing: screenWidth * 0.04,
          mainAxisSpacing: screenWidth * 0.04,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            isFavorite: favorites.contains(product),
            onFavoriteToggle: _toggleFavorite,
          );
        },
      ),
    );
  }

  // Favorite Screen
  Widget _buildFavoriteScreen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorites added.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final product = favorites[index];
                return ListTile(
                  leading: Image.asset(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.price),
                );
              },
            ),
    );
  }

  // Placeholder for other tabs
  Widget _buildPlaceholderScreen(String title) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Toggle favorite
  void _toggleFavorite(Product product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  // Helper Method to Build Cards
  Widget _buildCard({
    required String imagePath,
    required String title,
    required double screenWidth,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.04),
              child: Image.asset(
                imagePath,
                width: screenWidth,
                height: screenWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: screenWidth * 0.04,
              bottom: screenWidth * 0.04,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final Function(Product) onFavoriteToggle;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // Use Expanded to allow the image to resize flexibly
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.04),
                    topRight: Radius.circular(screenWidth * 0.04),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: screenWidth * 0.02,
                  right: screenWidth * 0.02,
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: screenWidth * 0.07,
                    ),
                    onPressed: () => onFavoriteToggle(product),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  product.price,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenWidth * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.005),
                          child: CircleAvatar(
                            radius: screenWidth * 0.015,
                            backgroundColor: index == 0
                                ? Colors.green
                                : Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: screenWidth * 0.05,
                      ),
                      onPressed: () {
                        // Camera action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
