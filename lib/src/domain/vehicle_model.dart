import 'customer_model.dart';

class Vehicle {
  const Vehicle({
    required this.id,
    required this.registrationNumber,
    this.chassisNumber,
    this.engineNumber,
    required this.manufacturer,
    required this.model,
    required this.variant,
    required this.manufacturingYear,
    required this.fuelType,
    required this.transmission,
    required this.color,
    required this.odometer,
    required this.owner,
  });
  final int id;

  /// Registration Number
  final String registrationNumber;

  final String? chassisNumber;

  final String? engineNumber;

  final String manufacturer;

  final String model;

  final String variant;

  final int manufacturingYear;

  final String fuelType;

  final String transmission;

  final String color;

  final int odometer;

  final Customer owner;
}
