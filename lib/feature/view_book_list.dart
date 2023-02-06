import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sepiabooklist/core/entity/Booklist.dart';
import 'package:sepiabooklist/feature/view_book_detail.dart';

class ViewBookListPage extends StatefulWidget {
  const ViewBookListPage({super.key});

  @override
  State<ViewBookListPage> createState() => _ViewBookListPageState();
}

class _ViewBookListPageState extends State<ViewBookListPage> {
  List<Booklist> booklist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBookList();
  }

  getBookList() async {
    List<Booklist> lists = [];
    final String response =
        await rootBundle.loadString('assets/json/books.json');
    final data = await json.decode(response);
    List items = data;
    lists = items.map((val) => Booklist.fromJson(val)).toList();
    setState(() {
      booklist = lists;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("booklist = ${booklist.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: ListView.separated(
        itemCount: booklist.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewBookDetailPage(booklist: booklist[index],)),
              );
            },
            child: ListTile(
              leading:
                  ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: booklist[index].thumbnailUrl != null ? ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    booklist[index].thumbnailUrl!,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ):const SizedBox(),
              ),
              title: Text(booklist[index].title != null ? booklist[index].title! : ""),
              subtitle: Text(booklist[index].shortDescription != null ? booklist[index].shortDescription! : ""),
            ),
          );
        },
      ),
    );
  }
}
