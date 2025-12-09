import 'package:flutter/material.dart';
import '../models/mock_data.dart';
import '../widgets/app_drawer.dart';

class TimetableScreen extends StatefulWidget {
  const TimetableScreen({super.key});

  @override
  State<TimetableScreen> createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _days = ['Pon', 'Wt', 'Śr', 'Czw', 'Pt'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan Lekcji'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          tabs: _days.map((day) => Tab(text: day)).toList(),
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(5, (index) {
          final dayIndex = index + 1; // 1 = Monday
          final lessons = MockData.timetable[dayIndex] ?? [];
          
          if (lessons.isEmpty) {
            return const Center(child: Text("Brak lekcji tego dnia"));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: lessons.length,
            itemBuilder: (context, i) {
              final lesson = lessons[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lesson.startTime, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(lesson.endTime, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  title: Text(lesson.subjectName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Sala: ${lesson.room}"),
                  trailing: const Icon(Icons.class_outlined),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Edycja planu wkrótce!")),
            );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
