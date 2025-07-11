import 'package:flutter/material.dart';
import 'package:ragdanews/style/colors/app_colors.dart';
import 'package:ragdanews/style/typography/app_text_styles.dart';
import 'package:ragdanews/widgets/dashboard/corrective_machine_card.dart';
import 'package:ragdanews/widgets/dashboard/spare_part_usage_chart.dart';
import 'package:ragdanews/widgets/dashboard/trouble_by_area_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.naplesBlue500.color,
        title: Text(
          'Dashboard',
          style: AppTextStyles.headline6Regular.copyWith(
            color: AppColors.neutral1.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CorrectiveMachineCard(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TroubleByAreaChart(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SparePartUsageChart(),
            ),
          ],
        ),
      ),
    );
  }
}
