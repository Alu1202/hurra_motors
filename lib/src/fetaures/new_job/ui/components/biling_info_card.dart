import 'package:flutter/material.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../components/input_fields/outlined_input_fields.dart';

class BillerInfoCard extends StatelessWidget {
  const BillerInfoCard({
    required this.vehicleController,
    required this.customerController,
    required this.contactController,
    required this.jobTypeController,
    required this.jobStatusController,
    required this.mechanicController,
  });

  final TextEditingController vehicleController;
  final TextEditingController customerController;
  final TextEditingController contactController;
  final TextEditingController jobTypeController;
  final TextEditingController jobStatusController;
  final TextEditingController mechanicController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Biller Info',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          LabeledOutlineTextField(
            label: 'Vehicle Number',
            controller: vehicleController,
            onChanged: (_) {},
          ),
          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Customer Name',
            controller: customerController,
            onChanged: (_) {},
          ),
          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Contact Number',
            controller: contactController,
            keyboardType: TextInputType.phone,
            onChanged: (_) {},
          ),
          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Job Type',
            controller: jobTypeController,
            onChanged: (_) {},
          ),
          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Job Status',
            controller: jobStatusController,
            onChanged: (_) {},
          ),
          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Assigned Mechanic',
            controller: mechanicController,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
