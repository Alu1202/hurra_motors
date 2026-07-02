import 'icons_path.dart';

class ServiceItem {

  const ServiceItem({required this.title, required this.icon});
  final String title;
  final String icon;
}

class ServiceData {
  static const List<ServiceItem> services = [
    ServiceItem(title: 'Car Inspections', icon: ServiceIcons.carInspections),
    ServiceItem(title: 'Car Spa & Cleaning', icon: ServiceIcons.carSpaCleaning),
    ServiceItem(title: 'Clutch Body', icon: ServiceIcons.clutchBody),
    ServiceItem(
      title: 'Detailing Services',
      icon: ServiceIcons.detailingServices,
    ),
    ServiceItem(title: 'Car Services', icon: ServiceIcons.carServicesMumbai),
    ServiceItem(title: 'Tyres & Wheel Care', icon: ServiceIcons.tyresWheelCare),
    ServiceItem(
      title: 'Denting & Painting',
      icon: ServiceIcons.dentingPainting,
    ),
    ServiceItem(title: 'Insurance Claims', icon: ServiceIcons.insuranceClaims),
    ServiceItem(
      title: 'AC Service & Repair',
      icon: ServiceIcons.acServiceRepair,
    ),
    ServiceItem(
      title: 'Suspension & Fitments',
      icon: ServiceIcons.suspensionFitments,
    ),
    ServiceItem(
      title: 'Windshield & Lights',
      icon: ServiceIcons.windshieldLights,
    ),
    ServiceItem(title: 'Batteries', icon: ServiceIcons.batteries),
  ];
}
