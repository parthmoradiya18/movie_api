import 'package:flutter/material.dart';
import 'package:movie_api/model.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Movies(),
  ));
}

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  final dio = Dio();
  List<dynamic> l = [];
  List l1 = [];
  bool t = false;
  bool search = false;

  get() async {
    final response = await dio.get('https://dummyapi.online/api/movies');
    print(response);
    l = response.data;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 1,
            color: Colors.black,
          );
        },
        itemCount: l.length,
        itemBuilder: (context, index) {
          model m = model.fromJson(l[index]);

          return Card(
            child: ListTile(
              leading: Text(
                "${m.id}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
              title: Text("${m.movie}"),
              trailing: Text("${m.rating}"),
              // subtitle: Image.network(m.image!),
              // subtitle: InkWell(onTap:
              //   () {
              //     // Uri.parse("${m.imdbUrl}");
              //
              //   },
              //   child: Text("movie"),),
            ),
          );
        },
      ),
    );
  }
}
