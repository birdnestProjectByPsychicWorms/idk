import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<Product> favoriteProducts = [
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
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Text(
                        'John William',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
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
              // Title
              Text(
                "Favorite Products",
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
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
              // Favorite Products Grid
              Expanded(
                child: favoriteProducts.isEmpty
                    ? const Center(
                        child: Text(
                          "No favorite products yet.",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: screenWidth > 600 ? 3 : 2,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: screenWidth * 0.04,
                          mainAxisSpacing: screenWidth * 0.04,
                        ),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final product = favoriteProducts[index];
                          return FavoriteProductCard(product: product);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteProductCard extends StatelessWidget {
  final Product product;

  const FavoriteProductCard({
    Key? key,
    required this.product,
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
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth * 0.04),
              topRight: Radius.circular(screenWidth * 0.04),
            ),
            child: Image.asset(
              product.imageUrl,
              height: screenWidth * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
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
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                Text(
                  product.price,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
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
