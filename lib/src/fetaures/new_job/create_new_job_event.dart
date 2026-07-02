import '../../core/base/base_event.dart';

abstract class JobFormEvent extends BaseEvent {
  const JobFormEvent();
}

class VehicleNumberChanged extends JobFormEvent {
  const VehicleNumberChanged(this.value);
  final String? value;
}

class CustomerNameChanged extends JobFormEvent {
  const CustomerNameChanged(this.value);
  final String? value;
}

class ContactNumberChanged extends JobFormEvent {
  const ContactNumberChanged(this.value);
  final String? value;
}

class JobTypeChanged extends JobFormEvent {
  const JobTypeChanged(this.value);
  final String? value;
}

class JobStatusChanged extends JobFormEvent {
  const JobStatusChanged(this.value);
  final String? value;
}

class AssignedMechanicChanged extends JobFormEvent {
  const AssignedMechanicChanged(this.value);
  final String? value;
}

// job details
class TyreAlignmentChanged extends JobFormEvent {
  const TyreAlignmentChanged(this.value);
  final bool? value;
}

class WheelBalancingChanged extends JobFormEvent {
  const WheelBalancingChanged(this.value);
  final bool? value;
}

class DentChanged extends JobFormEvent {
  const DentChanged(this.value);
  final bool? value;
}

class CurrentRunningKmChanged extends JobFormEvent {
  const CurrentRunningKmChanged(this.value);
  final int? value;
}

class CarAgeChanged extends JobFormEvent {
  const CarAgeChanged(this.value);
  final int? value;
}

class SubmitJobPressed extends JobFormEvent {
  const SubmitJobPressed();
}
