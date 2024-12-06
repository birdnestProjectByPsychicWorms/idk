import 'package:flutter/material.dart';
import '../../components/product-cart/index.dart';
import '../../models/product-cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;
  int _currentSectionIndex = 0;
  final List<Product> favorites = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final screens = [
      _buildFavoriteScreen(),
      _buildProductSection(screenWidth), // Example for products
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }

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
    ];

    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          isFavorite: favorites.contains(product),
          onFavoriteToggle: _toggleFavorite,
        );
      },
    );
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (favorites.contains(product)) {
        favorites.remove(product);
      } else {
        favorites.add(product);
      }
    });
  }

  Widget _buildFavoriteScreen() {
    return favorites.isEmpty
        ? Center(child: Text("No favorites yet"))
        : ListView(
            children: favorites.map((product) => Text(product.name)).toList(),
          );
  }
}
