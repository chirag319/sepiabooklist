import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sepiabooklist/core/entity/Booklist.dart';

class ViewBookDetailPage extends StatefulWidget {
  const ViewBookDetailPage({super.key,required this.booklist});
  final Booklist booklist;

  @override
  State<ViewBookDetailPage> createState() => _ViewBookDetailPageState();
}

class _ViewBookDetailPageState extends State<ViewBookDetailPage> {
  List<String> titles = ["Title","Author","Page Count","ISBN","Published Date","Status","Categories","Description"];
  List<dynamic> desc = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    desc.add(widget.booklist.title ?? "",);
    desc.add(widget.booklist.authors ?? "",);
    desc.add(widget.booklist.pageCount ?? "",);
    desc.add(widget.booklist.isbn ?? "",);
    desc.add(widget.booklist.publishedDate ?? "",);
    desc.add(widget.booklist.status ?? "",);
    desc.add(widget.booklist.categories ?? "",);
    desc.add(widget.booklist.longDescription ?? "",);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: ListView.separated(
        itemCount: titles.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          var descString = desc[index].toString();
          descString = descString.replaceAll("[", "");
          descString = descString.replaceAll("]", "");
          return ListTile(
            title: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: [
                Text("${titles[index]}: ",style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,color: Colors.black),),
                Text(descString,style: Theme.of(context).textTheme.bodySmall,),
              ],
            )
          );
        },
      ),
    );
  }
}
