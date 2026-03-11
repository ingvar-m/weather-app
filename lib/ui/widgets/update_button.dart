import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/api_providers.dart';
import 'package:weather_app/providers/location_provider.dart';

class UpdateButton extends ConsumerWidget {
  const UpdateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          ref.invalidate(locationProvider);
          ref.read(weatherStateProvider.future);
        },
        icon: Icon(
          Icons.restart_alt,
          color: Colors.white,
          size: 32,
        )
    );
  }
}

