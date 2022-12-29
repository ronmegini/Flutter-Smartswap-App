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
    {
      'name': 'תשלום למנקה',
      'desc': 'תשלום חודשי למנקה',
      'sideA': 'ניקיון פעמיים בחודש',
      'sideB': 'תשלום קבוע של 500₪'
    },
    {
      'name': 'עריכת וידיאו',
      'desc': 'תשלום חד פעמי תמורת עריכת וידיאו',
      'sideA': 'עריכת סרטון באורך 10 דקות',
      'sideB': 'תשלום של 400₪'
    },
    {
      'name': 'ועד בית',
      'desc': 'תשלום ועד בית',
      'sideA': 'אחזקת הבניין',
      'sideB': 'תשלום חוזר של 150₪'
    }
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

/*
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
*/

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map argument = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    argument['desc'],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Side A Agreement:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      argument['sideA'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Side B Agreement:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      argument['sideB'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ])));
  }
}
