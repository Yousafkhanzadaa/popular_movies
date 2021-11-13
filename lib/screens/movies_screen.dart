import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:popular_movies/components/movie_card.dart';
import 'package:popular_movies/models/data_model.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Popular Movies"),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<http.Response>(
        future: http.get(Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=4418a4dd7da6409b55bd0876c7540a10&language=en-US&page=1')),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = json.decode(snapshot.data!.body);
            return _movieGrid(orientation, data);
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }

  // -------------------------------------------------------------------
  // -------------------------------------------------------------------
  GridView _movieGrid(Orientation orientation, data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      ),
      itemCount: data['results'].length,
      itemBuilder: (context, index) {
        // var decoded = jsonDecode(snapshot.data!.body);
        var movie = Movie.formJson(data['results'][index]);

        return MovieCard(
          poster: movie.posterPath!,
          title: movie.title!,
          voteAverage: movie.voteAverage!,
        );
      },
    );
  }
}
