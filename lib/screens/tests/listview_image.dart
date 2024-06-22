import 'package:flutter/material.dart';

class ListViewImage extends StatelessWidget {
  final List<String> items = ['alo', 'ola', 'ole', 'oli'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length + 1, // +1 to account for the image
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('assets/images/hospital.png',
                        width: 100, height: 100),
                  ),
                ), // Your image asset
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        items[index - 1],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
