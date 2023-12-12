import 'package:flutter/material.dart';
import 'package:movie_app/model.dart/movie_model.dart';

class DetailMovie extends StatelessWidget {
  const DetailMovie({super.key, required this.model});
  final MovieModel model;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          // backgroundColor: Colors.transparent,
          elevation: 0, leadingWidth: 80,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 16),
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(14)),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(right: 16, top: 16),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(14)),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
        body: ListView(padding: EdgeInsets.only(top: 0), children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 588,
            child: Image.network(
              model.urlImage ??
                  '"https://image.tmdb.org/t/p/original/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
              fit: BoxFit.cover,
            ),
          ),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(24),
            children: [
              Text(
                model.tittle ?? 'UnTitle',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(model.year ?? 'u2018'),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      model.genre ?? 'Lucu',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(model.rating.toString()),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                // width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade800, width: 2),
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.blue[800],
                      ),
                      Text(
                        'Trailer',
                        style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
              ),
              Divider(height: 48, thickness: 2, color: Colors.black),
              Text(
                'Overview',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 24),
              Text(
                model.overview ?? 'Null',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
