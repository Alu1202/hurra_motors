import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_ext.dart';
import '../../../components/input_fields/outlined_input_fields.dart';
import '../../create_new_job_bloc.dart';
import '../../create_new_job_event.dart';

class JobDetailsCard extends StatelessWidget {
  const JobDetailsCard({
    required this.runningKmController,
    required this.carAgeController,
    required this.tyreAlignment,
    required this.wheelBalancing,
    required this.dent,
  });

  final TextEditingController runningKmController;
  final TextEditingController carAgeController;
  final bool tyreAlignment, wheelBalancing, dent;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<JobFormBloc>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,

        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor,
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Job Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),

          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Tyre Alignment'),
            value: tyreAlignment,
            onChanged: (val) => bloc.add(TyreAlignmentChanged(val)),
          ),

          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Wheel Balancing'),
            value: wheelBalancing,
            onChanged: (val) => bloc.add(WheelBalancingChanged(val)),
          ),

          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Dent Work Required'),
            value: dent,
            onChanged: (val) => bloc.add(DentChanged(val)),
          ),

          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Current Running (KM)',
            controller: runningKmController,
            keyboardType: TextInputType.number,
            suffixIcon: const Text('KM'),
            onChanged: (_) {},
            textStyle: context.textTheme.displaySmall?.copyWith(
              fontSize: 18,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 14),

          LabeledOutlineTextField(
            label: 'Car Age (Years)',
            controller: carAgeController,
            keyboardType: TextInputType.number,
            textStyle: context.textTheme.displaySmall?.copyWith(
              fontSize: 18,
              letterSpacing: 3,
            ),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
