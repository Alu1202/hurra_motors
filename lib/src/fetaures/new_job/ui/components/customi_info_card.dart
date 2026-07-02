import 'package:flutter/material.dart';

class CustomerInfoCard extends StatelessWidget {
  const CustomerInfoCard({
    super.key,
    this.customerName,
    this.mobileNumber,
    this.email,
    this.address,
    required this.onSearch,
    required this.onAddCustomer,
    this.onEdit,
  });

  final String? customerName;
  final String? mobileNumber;
  final String? email;
  final String? address;

  final VoidCallback onSearch;
  final VoidCallback onAddCustomer;
  final VoidCallback? onEdit;

  bool get hasCustomer =>
      customerName != null && customerName!.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Column(
        children: [
          /// Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            color: theme.colorScheme.primaryContainer,
            child: Row(
              children: [
                Icon(Icons.person, color: theme.colorScheme.primary),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    'Customer Information',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: onSearch,
                  icon: const Icon(Icons.search),
                  tooltip: 'Search Customer',
                ),
              ],
            ),
          ),

          if (hasCustomer)
            _customerDetails(context)
          else
            _emptyCustomer(context),
        ],
      ),
    );
  }

  Widget _customerDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: const Icon(Icons.person),
            ),
            title: Text(
              customerName!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(mobileNumber ?? ''),
          ),

          const SizedBox(height: 12),

          if (email != null && email!.isNotEmpty)
            _InfoRow(icon: Icons.email_outlined, title: 'Email', value: email!),

          if (address != null && address!.isNotEmpty)
            _InfoRow(
              icon: Icons.location_on_outlined,
              title: 'Address',
              value: address!,
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

  Widget _emptyCustomer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Icon(Icons.person_search, size: 64, color: Colors.grey.shade400),

          const SizedBox(height: 16),

          const Text(
            'No Customer Selected',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 8),

          const Text(
            'Search an existing customer or create a new customer.',
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
                  onPressed: onAddCustomer,
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
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
            width: 70,
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
