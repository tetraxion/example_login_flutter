import 'package:flutter/material.dart';
import 'package:praktikum_modul_7/about_page.dart';
import 'package:praktikum_modul_7/favorite_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _drinkFavorite = "..."; 
  final GlobalKey<FavoritePageState> _favoriteKey =
      GlobalKey<FavoritePageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(context: context, fullscreenDialog: true),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Minuman favorit $_drinkFavorite',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openDrinkFavorite(context: context, fullscreenDialog: false);
        },
        tooltip: 'Change Favorite',
        child: Icon(Icons.sentiment_satisfied),
      ),
    );
  }

  void _openPageAbout({
    required BuildContext context,
    required bool fullscreenDialog,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => AboutPage(),
      ),
    );
  }

  void _openDrinkFavorite({
    required BuildContext context,
    required bool fullscreenDialog,
  }) async {
    final int? _selectedIndex = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) {
          return FavoritePage(
            key: _favoriteKey,
            favoriteKey: _favoriteKey,
            radioGroupValue: _favoriteKey.currentState?.getSelectedIndex() ?? 0,
          );
        },
      ),
    );

    if (_selectedIndex != null) {
      List<String> _favoriteList = ['Teh', 'Kopi', 'Susu'];

      setState(() {
        _drinkFavorite = _favoriteList[_selectedIndex];
      });
    }
  }
}
