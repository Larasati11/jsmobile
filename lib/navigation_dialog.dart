import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.pink.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen - Laras'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

   _showColorDialog(BuildContext context) async{
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                setState(() {
                  color = Colors.blue.shade500;
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Purple'),
              onPressed: () {
                setState(() {
                  color = Colors.purple.shade500;
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                setState(() {
                  color = Colors.blue.shade500;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }
}