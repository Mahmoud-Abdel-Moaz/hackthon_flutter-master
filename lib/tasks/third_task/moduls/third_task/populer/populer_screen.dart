import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/third_task/moduls/third_task/widgets/movie_grid.dart';
import 'package:hackathon_fatura/tasks/third_task/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatefulWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  _PopularScreenState createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Provider.of<Movies>(context, listen: false)
        .fetchAndSetMovies(1)
        .then((value) => setState(() {
      _isLoading = false;
    })).catchError((error) => setState(() {
      _isLoading = false;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : MovieGrid(),
    );
  }
}
