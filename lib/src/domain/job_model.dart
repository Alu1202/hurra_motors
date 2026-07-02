import 'customer_model.dart';
import 'job_service_model.dart';
import 'vehicle_model.dart';

class Job {
  Job({
    required this.customer,
    required this.vehicle,
    required this.services,
    required this.total,
    this.remarks,
  });
  final Customer customer;

  final Vehicle vehicle;

  final List<JobService> services;

  final double total;

  final String? remarks;
}
