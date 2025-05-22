import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> slots = List.generate(10, (index) => "9:00 AM");
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/936117/pexels-photo-936117.jpeg',
    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg',
    'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اهلاً بك محمد هاني'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
              ),
              items: imageUrls.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "فترات اليوم 2024-11-13",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 110,
                ),
                itemCount: slots.length,
                itemBuilder: (context, index) => buildContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, size: 16),
              SizedBox(width: 5),
              Text("فترة النهار", style: TextStyle(fontSize: 12)),
            ],
          ),
          SizedBox(height: 4),
          Text("9:00 AM",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.attach_money, color: Colors.green, size: 16),
              SizedBox(width: 5),
              Text("200 ريال", style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
