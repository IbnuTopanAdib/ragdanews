import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';
import 'package:ragdanews/widgets/dashboard/custom_dropdown.dart';

class CorrectiveMachineCard extends StatelessWidget {
  const CorrectiveMachineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Corrective Maintenance (Machine)',
                  style: AppTextStyles.headline7SemiBold,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View All',
                        style: AppTextStyles.headline8Regular.copyWith(
                          color: AppColors.naplesBlue500.color,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blue),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropdown(
                  items: ['Building A', 'Building B'],
                  value: 'Building A',
                  onChanged: (String? value) {},
                ),
                const SizedBox(width: 16),
                CustomDropdown(
                  items: ['2024', '2025'],
                  value: '2024',
                  onChanged: (String? value) {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: PieChart(
                      PieChartData(
                        sections: _buildSections(),
                        sectionsSpace: 0,
                        centerSpaceRadius: 60,
                        startDegreeOffset: -90,
                        pieTouchData: PieTouchData(
                          touchCallback:
                              (FlTouchEvent event, pieTouchResponse) {},
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildLegend(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    const data = [
      {
        'value': 43,
        'title': '43%',
        'color': Colors.redAccent,
        'label': 'Engine',
      },
      {
        'value': 20,
        'title': '20%',
        'color': Colors.orangeAccent,
        'label': 'Hydraulics',
      },
      {
        'value': 15,
        'title': '15%',
        'color': Colors.blueAccent,
        'label': 'Electrical',
      },
      {
        'value': 10,
        'title': '10%',
        'color': Colors.cyanAccent,
        'label': 'Cooling',
      },
      {
        'value': 8,
        'title': '8%',
        'color': Colors.greenAccent,
        'label': 'Lubrication',
      },
      {
        'value': 4,
        'title': '4%',
        'color': Colors.lightGreenAccent,
        'label': 'Other',
      },
    ];

    return data.map((item) {
      return PieChartSectionData(
        value: (item['value'] as num).toDouble(),
        title: item['title'] as String,
        color: item['color'] as Color,
        radius: 24,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),

        badgePositionPercentageOffset: 1.1,
      );
    }).toList();
  }

  Widget _buildLegend() {
    const data = [
      {'color': Colors.redAccent, 'label': 'Engine'},
      {'color': Colors.orangeAccent, 'label': 'Hydraulics'},
      {'color': Colors.blueAccent, 'label': 'Electrical'},
      {'color': Colors.cyanAccent, 'label': 'Cooling'},
      {'color': Colors.greenAccent, 'label': 'Lubrication'},
      {'color': Colors.lightGreenAccent, 'label': 'Other'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: data.map((item) {
        return SizedBox(
          width: 100,
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item['label'] as String,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
