import '../../core/base/base_state.dart';
import '../../core/base/ui_action.dart';

class JobFormState extends BaseState {
  const JobFormState({
    super.isLoading,

    this.vehicleNumber,
    this.customerName,
    this.contactNumber,
    this.jobType,
    this.jobStatus,
    this.assignedMechanic,
    this.tyreAlignment = false,
    this.wheelBalancing = false,
    this.currentRunningKm,
    this.carAge,
    this.dent = false,
    super.action,
  });
  final String? vehicleNumber;
  final String? customerName;
  final String? contactNumber;
  final String? jobType;
  final String? jobStatus;
  final String? assignedMechanic;

  final bool tyreAlignment;
  final bool wheelBalancing;
  final int? currentRunningKm;
  final int? carAge;
  final bool dent;

  static const _unset = Object();

  @override
  JobFormState copyWith({
    Object? vehicleNumber = _unset,
    Object? customerName = _unset,
    Object? contactNumber = _unset,
    Object? jobType = _unset,
    Object? jobStatus = _unset,
    Object? assignedMechanic = _unset,
    bool? tyreAlignment,
    bool? wheelBalancing,
    Object? currentRunningKm = _unset,
    Object? carAge = _unset,
    bool? dent,
    bool? isLoading,
    UiAction action = const NoAction(),
  }) {
    return JobFormState(
      vehicleNumber: vehicleNumber == _unset
          ? this.vehicleNumber
          : vehicleNumber as String?,
      customerName: customerName == _unset
          ? this.customerName
          : customerName as String?,
      contactNumber: contactNumber == _unset
          ? this.contactNumber
          : contactNumber as String?,
      jobType: jobType == _unset ? this.jobType : jobType as String?,
      jobStatus: jobStatus == _unset ? this.jobStatus : jobStatus as String?,
      assignedMechanic: assignedMechanic == _unset
          ? this.assignedMechanic
          : assignedMechanic as String?,
      tyreAlignment: tyreAlignment ?? this.tyreAlignment,
      wheelBalancing: wheelBalancing ?? this.wheelBalancing,
      currentRunningKm: currentRunningKm == _unset
          ? this.currentRunningKm
          : currentRunningKm as int?,
      carAge: carAge == _unset ? this.carAge : carAge as int?,
      dent: dent ?? this.dent,

      // BaseState fields
      isLoading: isLoading ?? this.isLoading,
      action: action,
    );
  }
}
