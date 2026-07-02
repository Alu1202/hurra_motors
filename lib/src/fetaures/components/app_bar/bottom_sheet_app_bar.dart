import 'package:flutter/material.dart';

class BottomSheetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BottomSheetAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.onClose,
    this.actions,
  });

  final String title;
  final String? subTitle;
  final VoidCallback? onClose;
  final List<Widget>? actions;
  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
     automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          if (subTitle != null)
            Text(subTitle!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      actions: [
        if (onClose != null)
          IconButton(
            iconSize: 24,
            onPressed: onClose,
            icon: const Icon(Icons.close_rounded,
            size: 24,
            
            ),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
