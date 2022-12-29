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

  List<Map<String, dynamic>> contracts = [
    {'name': 'a', 'desc': 'a'},
    {'name': 'b', 'desc': 'b'},
    {'name': 'c', 'desc': 'c'}
  ];

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        for (var contract in contracts)
          TableRow(
            children: [
              ElevatedButton(
                child: Text(contract['name']),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(),
                          settings: RouteSettings(arguments: contract)));
                },
              ),
            ],
          ),
      ],
    );
  }
}

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final Map argument = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(argument['name']),
      ),
      body: Center(
        child: Text(argument['desc']),
      ),
    );
  }
}
