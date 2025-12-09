import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/app_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate global average
    double totalSum = 0;
    int subjectCount = 0;
    for (var s in MockData.subjects) {
      if (s.grades.isNotEmpty) {
        totalSum += s.average;
        subjectCount++;
      }
    }
    double globalAverage = subjectCount > 0 ? totalSum / subjectCount : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mój Dziennik'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Witaj!",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Średnia ocen: ${globalAverage.toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Section Title
            Text(
              "Najbliższe lekcje",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),

            // Timetable Preview (Mocking "Today's" lessons)
            ...MockData.timetable[1]!.map((lesson) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    lesson.startTime,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(lesson.subjectName),
                subtitle: Text("Sala: ${lesson.room}"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            )),

            const SizedBox(height: 24),
            Text(
              "Ostatnie oceny",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            
            // Recent Grades Preview
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade100,
                      child: const Text("5", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    ),
                    title: const Text("Matematyka"),
                    subtitle: const Text("Sprawdzian - Funkcje"),
                    trailing: const Text("2 dni temu"),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange.shade100,
                      child: const Text("3", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ),
                    title: const Text("Język Polski"),
                    subtitle: const Text("Rozprawka"),
                    trailing: const Text("5 dni temu"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
