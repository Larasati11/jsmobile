import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  String _current = 'Hello, Flutter!';
  final List<String> _favorites = [];

  String get current => _current;

  List<String> get favorites => _favorites;

  void getNext() {
    // Di sini Anda dapat mengganti dengan logika yang lebih baik, misalnya mengambil data secara acak.
    _current = 'Next random idea!';
    notifyListeners();
  }

  void toggleFavorite() {
    if (_favorites.contains(_current)) {
      _favorites.remove(_current);
    } else {
      _favorites.add(_current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage(); // Halaman generator
        break;
      case 1:
        page = FavoritesPage(); // Halaman favorit
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,  // Menggunakan halaman yang dipilih
            ),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var currentIdea = appState.current;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: currentIdea),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: const Text('Next Idea'),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              appState.toggleFavorite();
            },
            icon: Icon(appState.favorites.contains(currentIdea) ? Icons.favorite : Icons.favorite_border),
            label: const Text('Toggle Favorite'),
          ),
        ],
      ),
    );
  }
}

// Kelas FavoritesPage ditambahkan di sini
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.toLowerCase()), // Mengubah menjadi huruf kecil
          ),
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  final String pair;

  const BigCard({super.key, required this.pair});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.headlineMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.toLowerCase(), // Menggunakan toLowerCase untuk mengubah string menjadi huruf kecil
          style: style,
        ),
      ),
    );
  }
}
