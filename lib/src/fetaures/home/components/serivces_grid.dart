import 'package:flutter/material.dart';

import '../../../core/constants/hurra_motors_service.dart';
import '../../../core/extensions/context_ext.dart';
import '../../../core/helper/icons_helper.dart';
import '../../components/tappable_card.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ServiceData.services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // change as per UI
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = ServiceData.services[index];

        return TappableCard(
          onTap: () => {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(item.icon, width: 60, height: 70),
              const SizedBox(height: 6),
              SizedBox(
                height: 30, // fixed height for 2 lines
                child: Text(
                  item.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelSmall,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
