import 'package:flutter/material.dart';
import 'package:gamentic/UI/games_page.dart';
import 'package:gamentic/blocs/games_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Myapp(
      load: () {
        bloc.fetchallgames(
            "https://rawg.io/api/games?page_size=20&search=pubg&page=1");
      },
      bloc: bloc.getGames,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
