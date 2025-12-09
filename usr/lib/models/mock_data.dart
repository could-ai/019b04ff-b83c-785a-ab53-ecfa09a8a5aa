class Subject {
  final String id;
  final String name;
  final String teacher;
  final List<Grade> grades;

  Subject({
    required this.id,
    required this.name,
    required this.teacher,
    required this.grades,
  });

  double get average {
    if (grades.isEmpty) return 0.0;
    double sum = 0;
    double weightSum = 0;
    for (var g in grades) {
      sum += g.value * g.weight;
      weightSum += g.weight;
    }
    if (weightSum == 0) return 0.0;
    return sum / weightSum;
  }
}

class Grade {
  final double value;
  final int weight;
  final String description;
  final DateTime date;

  Grade({
    required this.value,
    required this.weight,
    required this.description,
    required this.date,
  });
}

class Lesson {
  final String subjectName;
  final String room;
  final String startTime;
  final String endTime;

  Lesson({
    required this.subjectName,
    required this.room,
    required this.startTime,
    required this.endTime,
  });
}

// Mock Data
class MockData {
  static List<Subject> subjects = [
    Subject(
      id: '1',
      name: 'Matematyka',
      teacher: 'Jan Kowalski',
      grades: [
        Grade(value: 5.0, weight: 3, description: 'Sprawdzian - Funkcje', date: DateTime.now().subtract(const Duration(days: 2))),
        Grade(value: 4.0, weight: 2, description: 'Kartkówka', date: DateTime.now().subtract(const Duration(days: 10))),
      ],
    ),
    Subject(
      id: '2',
      name: 'Język Polski',
      teacher: 'Anna Nowak',
      grades: [
        Grade(value: 3.0, weight: 3, description: 'Rozprawka', date: DateTime.now().subtract(const Duration(days: 5))),
        Grade(value: 5.0, weight: 1, description: 'Aktywność', date: DateTime.now().subtract(const Duration(days: 1))),
      ],
    ),
    Subject(
      id: '3',
      name: 'Fizyka',
      teacher: 'Piotr Wiśniewski',
      grades: [
        Grade(value: 4.5, weight: 2, description: 'Doświadczenie', date: DateTime.now().subtract(const Duration(days: 15))),
      ],
    ),
    Subject(
      id: '4',
      name: 'Historia',
      teacher: 'Maria Lewandowska',
      grades: [],
    ),
  ];

  static Map<int, List<Lesson>> timetable = {
    1: [ // Poniedziałek
      Lesson(subjectName: 'Matematyka', room: '101', startTime: '08:00', endTime: '08:45'),
      Lesson(subjectName: 'Język Polski', room: '203', startTime: '08:55', endTime: '09:40'),
      Lesson(subjectName: 'WF', room: 'Sala', startTime: '09:50', endTime: '10:35'),
    ],
    2: [ // Wtorek
      Lesson(subjectName: 'Fizyka', room: '105', startTime: '08:00', endTime: '08:45'),
      Lesson(subjectName: 'Matematyka', room: '101', startTime: '08:55', endTime: '09:40'),
    ],
    3: [ // Środa
      Lesson(subjectName: 'Historia', room: '12', startTime: '10:45', endTime: '11:30'),
      Lesson(subjectName: 'Informatyka', room: 'Lab 2', startTime: '11:40', endTime: '12:25'),
    ],
    4: [ // Czwartek
      Lesson(subjectName: 'Angielski', room: '110', startTime: '08:00', endTime: '08:45'),
      Lesson(subjectName: 'Matematyka', room: '101', startTime: '08:55', endTime: '09:40'),
    ],
    5: [ // Piątek
      Lesson(subjectName: 'Geografia', room: '205', startTime: '08:00', endTime: '08:45'),
      Lesson(subjectName: 'Godz. Wych.', room: '101', startTime: '08:55', endTime: '09:40'),
    ],
  };
}
