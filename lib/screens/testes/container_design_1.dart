import 'package:flutter/material.dart';

class ContainerDesign1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DESIGNKNOT.COM',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text(
                'UI/UX Discussion for Project.',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.3),
              ),
              const SizedBox(height: 8),
              const Text(
                '17th November - 11AM to 12PM',
                style: TextStyle(color: Color(0xFF27C499), fontSize: 12),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildCircleButton(
                            Icons.close, const Color(0xFF3A3A3A)),
                        const SizedBox(width: 8),
                        _buildCircleButton(
                            Icons.refresh, const Color(0xFF3A3A3A)),
                        const SizedBox(width: 8),
                        _buildCircleButton(
                            Icons.check, const Color(0xFF27C499)),
                      ],
                    ),
                  ),
                  _buildCircleButton(
                      Icons.person_outline, const Color(0xFF000000)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}
