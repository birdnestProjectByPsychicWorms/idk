import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final List<Product> favorites;
  final Function(Product) onFavoriteChanged;

  const ProductScreen({
    super.key,
    required this.favorites,
    required this.onFavoriteChanged,
  });

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final isFavorite = favorites.contains(product);

          return ProductCard(
            product: product,
            isFavorite: isFavorite,
            onFavoritePressed: onFavoriteChanged,
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final Function(Product) onFavoritePressed;

  const ProductCard({
    Key? key,
    required this.product,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  product.imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () => onFavoritePressed(product),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 14,
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
