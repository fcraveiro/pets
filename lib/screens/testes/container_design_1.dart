import 'package:flutter/material.dart';

class ContainerDesign1 extends StatefulWidget {
  const ContainerDesign1({super.key});

  @override
  State<ContainerDesign1> createState() => _ContainerDesign1State();
}

class _ContainerDesign1State extends State<ContainerDesign1> {
  double _usdAmount = 1240.0;
  double _n2cAmount = 5480.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Buy n2c Token',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildExchangeRow(),
          const SizedBox(height: 16),
          _buildExchangeRateInfo(),
          const SizedBox(height: 16),
          _buildSlider(),
          const SizedBox(height: 16),
          _buildBuyButton(),
        ],
      ),
    );
  }

  Widget _buildExchangeRow() {
    return Row(
      children: [
        Expanded(
          child: _buildCurrencyBox(
              'Spend', '\$ ${_usdAmount.toStringAsFixed(2)}', 'USD'),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.teal[200],
          ),
          child: const Icon(Icons.swap_horiz, color: Colors.white),
        ),
        Expanded(
          child: _buildCurrencyBox(
              'Buy n2c', '${_n2cAmount.toStringAsFixed(0)} n2c', 'N2C'),
        ),
      ],
    );
  }

  Widget _buildCurrencyBox(String label, String amount, String currency) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600])),
          const SizedBox(height: 4),
          Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(currency == 'USD' ? Icons.attach_money : Icons.token,
                  size: 16, color: Colors.purple),
              const SizedBox(width: 4),
              Text(currency, style: const TextStyle(color: Colors.purple)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExchangeRateInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.info_outline, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text('1 USD ≈ ${(_n2cAmount / _usdAmount).toStringAsFixed(2)} n2c',
            style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildSlider() {
    return Column(
      children: [
        Slider(
          value: _usdAmount,
          min: 0,
          max: 5450.20,
          onChanged: (value) {
            setState(() {
              _usdAmount = value;
              _n2cAmount = value * (_n2cAmount / 1240.0);
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0 USD', style: TextStyle(color: Colors.grey[600])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text('${_usdAmount.toStringAsFixed(0)} USD',
                  style: const TextStyle(color: Colors.white)),
            ),
            Text('\$ 5,450.20', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ],
    );
  }

  Widget _buildBuyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement buy functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Buy n2c', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
