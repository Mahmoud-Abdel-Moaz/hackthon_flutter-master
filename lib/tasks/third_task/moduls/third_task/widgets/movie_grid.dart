import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/moduls/third_task/widgets/movie_item.dart';
import 'package:hackathon_fatura/tasks/third_task/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieData = Provider.of<Movies>(context);
    final movies =  MovieData.items;
    return movies.isEmpty
        ? Center(
      child: Text(
        "Some Thing Wrong!",
      ),
    )
        : GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: movies[i],
        child: MovieItem(),
      ),
    );
  }
}
