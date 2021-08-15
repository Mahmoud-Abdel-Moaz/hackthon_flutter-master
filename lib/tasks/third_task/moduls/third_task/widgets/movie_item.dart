import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/providers/movie.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatefulWidget {
  const MovieItem({Key? key}) : super(key: key);

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<Movie>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          movie.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Movie>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
              icon: Icon(
                  product.isFavorite ? Icons.favorite_border : Icons.favorite),
            ),
          ),
          title: Text(
            movie.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
