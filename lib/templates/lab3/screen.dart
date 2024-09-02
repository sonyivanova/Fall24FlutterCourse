import 'package:fall_24_flutter_course/templates/lab3/hydration.dart';
import 'package:fall_24_flutter_course/templates/lab3/main.dart';
import 'package:fall_24_flutter_course/templates/lab3/notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HydrationScreen extends ConsumerWidget {
  const HydrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add ref.watch and use provider to get the water intake
    final waterIntake = ref.watch(waterIntakeProvider);
    return Scaffold(
      // Add AppBar with Icon to reset the water intake as actions parameter of AppBar
      appBar: AppBar(
        title: const Text('Hydration Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(waterIntakeProvider.notifier).reset(),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add text to display the water intake
            Text('Water Intake: ${waterIntake.toStringAsFixed(2)} liters'),
            // Add HydrationWidget to display the water intake and put waterIntake into it
            HydrationWidget(waterIntakeLevel: waterIntake)
            // Add more UI components if necessary
          ],
        ),
      ),
      // Add floating action button to increment the water intake using ref.read(waterIntakeProvider.notifier).increment(x)
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(waterIntakeProvider.notifier).increment(0.25),
        tooltip: waterIntake < maxWaterIntake
            ? 'Drink Water'
            : 'Max Limit Reached',
        child: Icon(Icons.water_drop),
      ),
    );
  }
}
