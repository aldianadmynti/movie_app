import 'package:flutter/material.dart';
import 'package:movie_app/model.dart/movie_poster_model.dart';
import 'package:movie_app/page/detail.dart';
import 'package:movie_app/service/api_service.dart';

class ListPosterMovie extends StatelessWidget {
  ListPosterMovie({
    super.key,
    required this.listMovie,
  });

  final List<MoviePosterModel> listMovie;
  final _service = ApiService();

  void getDetail(context, id) async {
    var data = await _service.getDetail(id);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailMovie(model: data),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listMovie.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            getDetail(context, listMovie[index].id);
          },
          child: Image.network(listMovie[index].urlPoster!, fit: BoxFit.cover),
        );
      },
    );
  }
}
