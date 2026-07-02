class Service {
  const Service({
    required this.id,
    this.parentId,
    required this.name,
    required this.type,
    this.value,
    this.rate = 0,
    this.description,
    this.isChargeable = true,
    this.sortOrder = 0,
  });
  final int id;

  /// null = Root Service
  final int? parentId;

  final String name;

  final ServiceType type;

  /// bool, number, text, dropdown, etc.
  final dynamic value;

  final double rate;

  final String? description;

  final bool isChargeable;

  final int sortOrder;
}

enum ServiceType { group, checkbox, number, text, dropdown, date, quantity }
