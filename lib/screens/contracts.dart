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
  final List<Map<String, String>> listOfColumns = [
    {"Name": "AAAAAA", "Description": "1"},
    {"Name": "BBBBBB", "Description": "2"},
    {"Name": "CCCCCC", "Description": "3"}
  ];
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Description'))
      ],
      rows: listOfColumns
          .map(
            ((element) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(element["Name"]!)),
                    DataCell(Text(element["Description"]!)),
                  ],
                )),
          )
          .toList(),
    );
  }
}
