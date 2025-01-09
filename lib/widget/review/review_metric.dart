import 'package:flutter/material.dart';

class ReviewMetric extends StatelessWidget {
  const ReviewMetric({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMetricRow('Cleanliness', 4),
        _buildMetricRow('Communication', 5),
        _buildMetricRow('Area near place', 4),
        _buildMetricRow('Neighbors', 3),
        _buildMetricRow('Amenities', 4),
      ],
    );
  }

  Widget _buildMetricRow(String label, int rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(label),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Container(
                  height: 4,
                  width: (rating / 5) * 200,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(rating.toString()),
        ],
      ),
    );
  }
}