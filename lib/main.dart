import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Step 2
    Widget titleSection = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 10),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'The Perks of Being a Wallflower',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                Text(
                  '2012 | Directed by Stephen Chbosky',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // const Text('41'),
        ],
      ),
    );

// Add Movie Tag Section
    Widget movieTagSection = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 32, right: 14, top: 10, bottom: 10),
          child: Chip(
            label: Text('Coming of Age'),
            backgroundColor: Color.fromARGB(255, 174, 202, 222),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0, right: 14, top: 10, bottom: 10),
          child: Chip(
            label: Text('Drama'),
            backgroundColor: Color.fromARGB(255, 174, 202, 222),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
          child: Chip(
            label: Text('Romance'),
            backgroundColor: Color.fromARGB(255, 174, 202, 222),
          ),
        ),
      ],
    );

    // Step 3(b)
    // Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(
            '7.1/10', 'images/icons/imdb-round-big2.png', 'IMDb'),
        _buildButtonColumn(
            '85%', 'images/icons/rottenTomatoes.png', 'Rotten Tomatoes'),
        _buildButtonColumn('67%', 'images/icons/metacritic.png', 'Metacritic'),
      ],
    );

    // Step 4 -- implement the text section -- put text into a Container & add padding
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
          'Pittsburgh, Pennsylvania, 1991. Socially awkward high school freshman Charlie is a '
          'wallflower, always watching life from the sidelines, until two senior '
          'students, Sam and her stepbrother Patrick, become his mentors, helping '
          'him discover the joys of friendship, music and love...',
          textAlign: TextAlign.justify, // justify synopsis text
          softWrap: true, // text lines will fill column width (w/ boundary)
          style: TextStyle(
            color: Color.fromARGB(255, 210, 210, 210),
          )),
    );

    return MaterialApp(
      title: 'Movie Details',
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 19, 19, 19)),
      home: Scaffold(
        // appBar: AppBar(
        //       title: const Text('Flutter layout demo'),
        //     ),
        body: ListView(
          // Step 6 -- replace Column > ListView
          // Note: ListView supports app body scrolling
          children: [
            // Step 5 -- add image (also at pubspec.yaml)
            Image.asset(
              'images/perks.jpg',
              width: 500,
              height: 500,
              fit: BoxFit.cover, // image should be small but cover entire box
            ),
            titleSection,
            movieTagSection,
            buttonSection, // Step 3(c) - add buttonSection to body
            textSection, // Step 4(b) -- add textSection to body
          ],
        ),
      ),
    );
  }

// Step 3(a)
  Column _buildButtonColumn(String rating, String imagePath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(margin: const EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.star, color: color, size: 20),
            Text(rating,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255))),
          ],
        ),
        Container(margin: const EdgeInsets.only(top: 8)),
        Image.asset(
          imagePath,
          height: 40,
          width: 40,
        ),
        Container(margin: const EdgeInsets.only(top: 8)),
        Text(
          label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ],
    );
  }
}
