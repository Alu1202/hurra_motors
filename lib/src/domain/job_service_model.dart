class JobService {
  JobService({
    required this.serviceId,
    this.value,
    this.quantity = 1,
    required this.rate,
    required this.total,
    this.remarks,
    required this.performedAt,
  });
  final int serviceId;

  final dynamic value;

  final int quantity;

  final double rate;

  final double total;

  final String? remarks;

  final DateTime performedAt;
}
