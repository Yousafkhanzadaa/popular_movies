import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MovieCard extends StatelessWidget {
  final String poster;
  final String title;
  final String voteAverage;

  const MovieCard(
      {Key? key,
      required this.poster,
      required this.title,
      required this.voteAverage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var url = "http://image.tmdb.org/t/p/w500/$poster";
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        // color: Colors.deepOrangeAccent,
        image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter),
      ),
      child: Column(
        children: [
          const Spacer(),
          _textBar(context, title, voteAverage),
        ],
      ),
    );
  }

  Widget _textBar(context, String title, String voteAverage) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Colors.black54,
            Colors.black38,
            Colors.black26,
            Colors.black12,
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: _titleAverage(title, voteAverage),
    );
  }

  Widget _titleAverage(String title, String voteAverage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "$voteAverage/10",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
