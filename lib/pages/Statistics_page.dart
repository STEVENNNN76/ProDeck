import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 40), // Adjust the spacing as needed
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(CupertinoIcons.back),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Statistics',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Focus',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Center(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ChartLegend('Fitness', Colors.green),
                  ChartLegend('Reading', Colors.orange),
                  ChartLegend('Work', Colors.red),
                  ChartLegend('Mindfulness', Colors.blue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartLegend extends StatelessWidget {
  final String text;
  final Color color;

  const ChartLegend(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
