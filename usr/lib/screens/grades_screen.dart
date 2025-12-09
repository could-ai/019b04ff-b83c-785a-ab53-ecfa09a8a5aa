import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/app_drawer.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oceny'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: MockData.subjects.length,
        itemBuilder: (context, index) {
          final subject = MockData.subjects[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  subject.average > 0 ? subject.average.toStringAsFixed(1) : "-",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(subject.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(subject.teacher),
              children: [
                if (subject.grades.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Brak ocen"),
                  )
                else
                  ...subject.grades.map((grade) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getColorForGrade(grade.value),
                      foregroundColor: Colors.white,
                      child: Text(grade.value.toString()),
                    ),
                    title: Text(grade.description),
                    subtitle: Text("Waga: ${grade.weight} • ${grade.date.toString().split(' ')[0]}"),
                  )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Funkcja dodawania ocen wkrótce!")),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Dodaj ocenę"),
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Funkcja dodawania przedmiotu wkrótce!")),
            );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _getColorForGrade(double grade) {
    if (grade >= 5) return Colors.green;
    if (grade >= 4) return Colors.lightGreen;
    if (grade >= 3) return Colors.orange;
    if (grade >= 2) return Colors.deepOrange;
    return Colors.red;
  }
}
