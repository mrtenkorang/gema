import 'package:flutter/material.dart';

class AppChoiceChip extends StatelessWidget {
  const AppChoiceChip({
    super.key,
    required this.selected,
    this.onSelected,
    required this.label,
  });
  final bool selected;
  final String label;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: selected ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.surface,
      label: Text(
        label,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
          color: selected ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface
        ),
      ),
      selected: selected,
      selectedShadowColor: Theme.of(context).colorScheme.secondary,
      onSelected: onSelected,
    );
  }
}