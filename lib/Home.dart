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
      name: 'jackets',
      image: 'assets/jackets.png',
      price: 3000,
      description: 'This versatile jacket combines contemporary style with functionality, featuring a windproof, water-resistant shell and a soft inner lining for maximum comfort. It has multiple secure pockets for essentials and an adjustable hood and cuffs for a tailored fit. Perfect for both casual and formal wear.',
    ),
    Product(
      name: 'shirts',
      image: 'assets/shirts.png',
      price: 2000,
      description: 'These shirts offer a perfect blend of comfort and style, featuring soft, breathable fabrics and modern designs. Ideal for casual or formal wear, they elevate any wardrobe effortlessly.',
    ),
    Product(
      name: 'casual shirts',
      image: 'assets/casual.png',
      price: 1500,
      description: 'Our casual shirts are crafted for comfort and effortless style, featuring lightweight fabrics, vibrant colors, and relaxed fits. Perfect for weekend outings or laid-back gatherings, they add a touch of sophistication to any casual look.',
    ),
    Product(
      name: 'jeans',
      image: 'assets/jeans.png',
      price: 1800,
      description: ' Our jeans offer the perfect balance of comfort and durability, crafted from high-quality denim with a modern fit. Designed to complement any look, they feature a versatile style suitable for both casual and semi-formal occasions.',
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Grid'),
        centerTitle: true,
        backgroundColor: Colors.teal[400],
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
              childAspectRatio: 0.75, // Aspect ratio for cards
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '₹${product.price}',
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
