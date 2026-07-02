import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  const ComplaintCard({
    super.key,
    required this.complaintController,
    required this.remarksController,
    this.priority = JobPriority.normal,
    this.onPriorityChanged,
  });

  final TextEditingController complaintController;
  final TextEditingController remarksController;

  final JobPriority priority;
  final ValueChanged<JobPriority>? onPriorityChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(width: 10),

                Text(
                  'Complaint Details',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: complaintController,
                  minLines: 3,
                  maxLines: 5,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Customer Complaint *',
                    hintText: "Describe customer's complaint...",
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.report_problem_outlined),
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: remarksController,
                  minLines: 2,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Service Advisor Remarks',
                    hintText: 'Internal remarks...',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.sticky_note_2_outlined),
                  ),
                ),

                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Priority',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),

                const SizedBox(height: 8),

                Wrap(
                  spacing: 10,
                  children: [
                    ChoiceChip(
                      label: const Text('Low'),
                      selected: priority == JobPriority.low,
                      onSelected: (_) =>
                          onPriorityChanged?.call(JobPriority.low),
                    ),

                    ChoiceChip(
                      label: const Text('Normal'),
                      selected: priority == JobPriority.normal,
                      onSelected: (_) =>
                          onPriorityChanged?.call(JobPriority.normal),
                    ),

                    ChoiceChip(
                      label: const Text('High'),
                      selected: priority == JobPriority.high,
                      onSelected: (_) =>
                          onPriorityChanged?.call(JobPriority.high),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum JobPriority { low, normal, high }
