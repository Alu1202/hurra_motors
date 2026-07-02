class JobInfo {
  JobInfo({
    required this.vehicleNumber,
    required this.customerName,
    required this.contactNumberm,
    required this.jobType,
    required this.assignedMechanic,
    required this.currentRunningKm,
    required this.carAge,
    required this.hasTyreAlignment,
    required this.hasWheelBalancing,
    required this.hasDentWork,
    required this.createdAt,
    required this.modifiedAt,
  });

  final String vehicleNumber,
      customerName,
      contactNumberm,
      jobType,
      assignedMechanic,
      currentRunningKm,
      carAge;

  final bool hasTyreAlignment, hasWheelBalancing, hasDentWork;
  final DateTime createdAt, modifiedAt;

  JobInfo copyWith({
    String? vehicleNumber,
    String? customerName,
    String? contactNumberm,
    String? jobType,
    String? assignedMechanic,
    String? currentRunningKm,
    String? carAge,
    bool? hasTyreAlignment,
    bool? hasWheelBalancing,
    bool? hasDentWork,
    DateTime? createdAt,
    modifiedAt,
  }) {
    return JobInfo(
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      customerName: customerName ?? this.customerName,
      contactNumberm: contactNumberm ?? this.contactNumberm,
      jobType: jobType ?? this.jobType,
      assignedMechanic: assignedMechanic ?? this.assignedMechanic,
      currentRunningKm: currentRunningKm ?? this.currentRunningKm,
      carAge: carAge ?? this.carAge,
      hasTyreAlignment: hasTyreAlignment ?? this.hasTyreAlignment,
      hasWheelBalancing: hasWheelBalancing ?? this.hasWheelBalancing,
      hasDentWork: hasDentWork ?? this.hasDentWork,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
    );
  }
}
