// features/on_bording/widgets/container_widget.dart
import 'package:flutter/material.dart';
import 'package:movie_platform_app/core/utils/app_colors.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 52,
      decoration: BoxDecoration(
        color:isActive?AppColrs.primaryColor: Color(0xff1E1E1E),
        borderRadius: BorderRadius.circular(2)
      ),
    );
  }
}