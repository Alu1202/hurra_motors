import 'package:flutter/material.dart';

class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({
    super.key,
    this.registrationNumber,
    this.manufacturer,
    this.model,
    this.variant,
    this.fuelType,
    this.transmission,
    this.runningKm,
    this.color,
    this.manufacturingYear,
    required this.onSearch,
    required this.onAddVehicle,
    this.onEdit,
  });

  final String? registrationNumber;
  final String? manufacturer;
  final String? model;
  final String? variant;
  final String? fuelType;
  final String? transmission;
  final int? runningKm;
  final String? color;
  final int? manufacturingYear;

  final VoidCallback onSearch;
  final VoidCallback onAddVehicle;
  final VoidCallback? onEdit;

  bool get hasVehicle =>
      registrationNumber != null && registrationNumber!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          /// Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            color: theme.colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(Icons.directions_car, color: theme.colorScheme.primary),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    'Vehicle Information',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: onSearch,
                  icon: const Icon(Icons.search),
                  tooltip: 'Search Vehicle',
                ),
              ],
            ),
          ),

          hasVehicle ? _vehicleDetails(context) : _emptyVehicle(context),
        ],
      ),
    );
  }

  Widget _vehicleDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.directions_car),
            ),
            title: Text(
              registrationNumber!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              [
                manufacturer,
                model,
                variant,
              ].where((e) => e != null && e.isNotEmpty).join(' • '),
            ),
          ),

          const SizedBox(height: 12),

          if (fuelType != null)
            _VehicleInfoRow(
              icon: Icons.local_gas_station_outlined,
              title: 'Fuel',
              value: fuelType!,
            ),

          if (transmission != null)
            _VehicleInfoRow(
              icon: Icons.settings_outlined,
              title: 'Transmission',
              value: transmission!,
            ),

          if (runningKm != null)
            _VehicleInfoRow(
              icon: Icons.speed,
              title: 'Running KM',
              value: '$runningKm km',
            ),

          if (manufacturingYear != null)
            _VehicleInfoRow(
              icon: Icons.calendar_month_outlined,
              title: 'Year',
              value: manufacturingYear.toString(),
            ),

          if (color != null)
            _VehicleInfoRow(
              icon: Icons.palette_outlined,
              title: 'Color',
              value: color!,
            ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onSearch,
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text('Change'),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: FilledButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _emptyVehicle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(Icons.no_crash_outlined, size: 64, color: Colors.grey.shade400),

          const SizedBox(height: 16),

          const Text(
            'No Vehicle Selected',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          const Text(
            'Search an existing vehicle or register a new vehicle.',
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onSearch,
                  icon: const Icon(Icons.search),
                  label: const Text('Search'),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: FilledButton.icon(
                  onPressed: onAddVehicle,
                  icon: const Icon(Icons.add),
                  label: const Text('New'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VehicleInfoRow extends StatelessWidget {
  const _VehicleInfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey),

          const SizedBox(width: 12),

          SizedBox(
            width: 90,
            child: Text(title, style: const TextStyle(color: Colors.grey)),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
