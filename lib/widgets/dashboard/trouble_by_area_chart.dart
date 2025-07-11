import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';

class TroubleByAreaChart extends StatelessWidget {
  TroubleByAreaChart({super.key});

  final List<List<double>> buildingTroubleCounts = [
    [2, 1, 1, 2, 1, 2], // Building A
    [1, 2, 0, 1, 2, 1], // Building A1
    [2, 2, 1, 2, 1, 3], // Building B
    [1, 1, 0, 1, 1, 1], // Building B1
    [2, 2, 1, 2, 1, 2], // Building C
  ];

  final List<String> buildingNames = ['A', 'A1', 'B', 'B1', 'C'];
  final List<Color> buildingColors = [
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.greenAccent,
    Colors.lightGreen,
    Colors.orangeAccent,
  ];
  final List<String> dayLabels = [
    '22/08/2024',
    '25/08/2024',
    '26/08/2024',
    '27/08/2024',
    '28/08/2024',
    '29/08/2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Trouble by Area', style: AppTextStyles.headline7SemiBold),

            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 8,
                        minY: 0,
                        groupsSpace: 16,
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Transform.rotate(
                                    angle: -0.5,
                                    child: Text(
                                      dayLabels[value.toInt()],
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: AppColors.neutral7.color,
                                      ),
                                    ),
                                  ),
                                );
                              },

                              reservedSize: 28,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 2,
                              getTitlesWidget: (value, meta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppColors.neutral7.color,
                                  ),
                                );
                              },
                              reservedSize: 28,
                            ),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: false,
                          horizontalInterval: 2,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: AppColors.neutral7.color.withAlpha(
                                (0.2 * 255).round(),
                              ),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.neutral7.color.withAlpha(
                                (0.5 * 255).round(),
                              ),
                              width: 1,
                            ),
                            left: BorderSide(
                              color: AppColors.neutral7.color.withAlpha(
                                (0.5 * 255).round(),
                              ),
                              width: 1,
                            ),
                          ),
                        ),
                        barGroups: List.generate(dayLabels.length, (dayIndex) {
                          return BarChartGroupData(
                            x: dayIndex,
                            groupVertically: true,
                            barsSpace: 2, // Space between stacked bars
                            barRods: List.generate(buildingTroubleCounts.length, (
                              buildingIndex,
                            ) {
                              return BarChartRodData(
                                toY:
                                    buildingTroubleCounts[buildingIndex][dayIndex],
                                color: buildingColors[buildingIndex],
                                width: 20,
                                borderRadius: BorderRadius.zero,
                                fromY: _getFromY(dayIndex, buildingIndex),
                              );
                            }),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 80,
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

  double _getFromY(int dayIndex, int buildingIndex) {
    if (buildingIndex == 0) return 0;
    double fromY = 0;
    for (int i = 0; i < buildingIndex; i++) {
      fromY += buildingTroubleCounts[i][dayIndex];
    }
    return fromY;
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: List.generate(buildingNames.length, (index) {
        return SizedBox(
          width: 120,
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: buildingColors[index],
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Building ${buildingNames[index]}',
                  style: AppTextStyles.headline8Regular.copyWith(
                    color: AppColors.neutral7.color,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
