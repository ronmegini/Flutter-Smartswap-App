import 'package:flutter/material.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(child: ContractsTable());
  }
}

class ContractsTable extends StatelessWidget {
  ContractsTable({super.key});

  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Table(
            children: [
              for (var item in items)
                TableRow(
                  children: [
                    ElevatedButton(
                      child: Text(item),
                      onPressed: () {
                        // Handle button press
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
