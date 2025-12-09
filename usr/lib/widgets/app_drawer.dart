import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Uczeń"),
            accountEmail: const Text("moj@dziennik.pl"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "U",
                style: TextStyle(fontSize: 24.0, color: Theme.of(context).primaryColor),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Pulpit'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.grade),
            title: const Text('Oceny'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/grades');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_view_week),
            title: const Text('Plan lekcji'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/timetable');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ustawienia'),
            onTap: () {
              // Placeholder
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
