import 'package:flutter/material.dart';
import 'package:news/shared/widgets/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppTheme.primary,
      ),
    );
  }
}
