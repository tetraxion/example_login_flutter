import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final int radioGroupValue;
  final GlobalKey<FavoritePageState> favoriteKey;

  FavoritePage({
    Key? key,
    required this.radioGroupValue,
    required this.favoriteKey,
  }) : super(key: key);

  @override
  FavoritePageState createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  List<String> _favoriteList = [];
  String? _selectedFavorite;
  int _radioGroupValue = 0;

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedFavorite = _favoriteList[index];
      print('_selectedRadioValue $_selectedFavorite');
    });
  }

  @override
  void initState() {
    super.initState();
    _favoriteList
      ..add('Teh')
      ..add('Kopi')
      ..add('Susu');
    _selectedFavorite = _favoriteList[widget.radioGroupValue];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (_selectedFavorite != null) {
                widget.favoriteKey.currentState
                    ?.setSelectedFavorite(_selectedFavorite!);
                Navigator.pop(context, _radioGroupValue);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioGroupValue,
                    onChanged: (value) => _radioOnChanged(value!),
                  ),
                  Text('Teh'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _radioGroupValue,
                    onChanged: (value) => _radioOnChanged(value!),
                  ),
                  Text('Kopi'),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _radioGroupValue,
                    onChanged: (value) => _radioOnChanged(value!),
                  ),
                  Text('Susu'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedFavorite(String favorite) {
    setState(() {
      _selectedFavorite = favorite;
    });
  }

  int getSelectedIndex() {
    return _radioGroupValue;
  }
}
