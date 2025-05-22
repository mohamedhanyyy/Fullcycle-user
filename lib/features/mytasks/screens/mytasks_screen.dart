import 'package:flutter/material.dart';

class MyTasksScreen extends StatelessWidget {
  final List<Map<String, dynamic>> days = List.generate(10, (index) {
    final day = index + 1;
    if (day % 2 == 0) {
      return {
        'date': '09/${day.toString().padLeft(2, '0')}',
        'from': '12:00 PM',
        'to': '04:00 PM',
        'reward': '100.00 ريال',
      };
    } else {
      return {
        'date': '09/${day.toString().padLeft(2, '0')}',
        'noTasks': true,
      };

    }
  });

  MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('September 2022'),
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: days.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          // childAspectRatio: 0.9,
          mainAxisExtent: 150
        ),
        itemBuilder: (context, index) {
          final day = days[index];
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day['date'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                if (day['noTasks'] == true)
                  Text(
                    'لا يوجد مهام',
                    style: TextStyle(color: Colors.blue.shade900),
                    textAlign: TextAlign.center,
                  )
                else
                  Column(
                     children: [
                      Text('${day['from']}'),
                      Text('${day['to']}'),
                      const SizedBox(height: 4),
                      Center(
                        child: Text(
                          '${day['reward']}',
                          style: const TextStyle(color: Colors.green,fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
