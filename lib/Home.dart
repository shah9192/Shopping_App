import 'package:flutter/material.dart';
import 'product.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Create a list of products
  final List<Product> products = [
    Product(
      name: 'AIRPODS PRO',
      image: 'assets/airpods.png',
      price: 3000,
      description: 'The AirPods Pro (2nd generation) elevate your audio experience with advanced features and cutting-edge technology. They offer active noise cancellation, effectively blocking out external sounds, and a transparency mode that lets you hear your surroundings when needed. The improved spatial audio provides an immersive listening experience, making it feel like the sound is all around you.',
    ),
    Product(
      name: 'DT900 ULTRA',
      image: 'assets/dt900.png',
      price: 2000,
      description: 'The DT900 Ultra Watch is a sophisticated blend of cutting-edge technology and stylish design, perfect for those who value functionality and aesthetics. Featuring a vibrant, high-resolution display, this smartwatch provides clear visibility in any lighting, allowing you to effortlessly access notifications, track fitness metrics, and monitor health stats.'
    ),
    Product(
      name: 'ACTIVE 2',
      image: 'assets/active2.png',
      price: 1500,
      description: 'The Samsung Galaxy Watch Active2 is a versatile smartwatch designed for those who lead an active lifestyle. With its sleek and lightweight design, it seamlessly combines style and functionality, making it suitable for both workouts and everyday wear.'
    ),
    Product(
      name: 'HK9',
      image: 'assets/hk9.png',
      price: 1800,
      description: 'The HK9 smartwatch is a robust and stylish wearable designed to enhance your everyday activities. Featuring a sleek, modern design, it pairs functionality with a comfortable fit, making it suitable for any occasion—whether youre at work, exercising, or out on the town.'
    ),
    Product(
      name: 'LED AIRPODS',
      image: 'assets/led airpods.png',
      price: 1800,
      description: 'The LED AirPods are a stylish and innovative take on true wireless earbuds, designed to deliver a superior listening experience while making a bold fashion statement. Featuring a sleek, modern design, these earbuds come with an eye-catching LED light display that not only enhances their aesthetic appeal but also provides visual cues for battery life and connectivity status.'
    ),
    Product(
      name: 'S9 ULTRA',
      image: 'assets/s9.png',
      price: 3500,
      description: 'The Samsung Galaxy S9 Ultra Gold is a stunning flagship smartphone that combines premium design with cutting-edge technology. Its luxurious gold finish exudes sophistication, making it a true statement piece in your hand'
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Products'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              mainAxisSpacing: 16,
              crossAxisSpacing: 18,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              Product product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(product: product),
                    ),
                  );
                },
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product image container
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Product name and price section
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Rs ${product.price}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
