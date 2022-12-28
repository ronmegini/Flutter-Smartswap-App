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

  final List<String> items = ['שכר דירה', 'תשלום למנקה', 'תשלום למעצב גרפי'];

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        for (var item in items)
          TableRow(
            children: [
              ElevatedButton(
                child: Text(item),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(),
                      ));
                },
              ),
            ],
          ),
      ],
    );
  }
}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: const Center(
        child: Text('This is the details screen'),
      ),
    );
  }
}
