class Customer {
  const Customer({
    required this.id,
    required this.name,
    required this.mobile,
    this.alternateMobile,
    this.email,
    this.gstNumber,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.notes,
  });
  final int id;

  final String name;

  final String mobile;

  final String? alternateMobile;

  final String? email;

  final String? gstNumber;

  final String? address;

  final String? city;

  final String? state;

  final String? pincode;

  final String? notes;
}
