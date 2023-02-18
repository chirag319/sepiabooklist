import 'package:flutter/material.dart';
import 'package:sepiabooklist/core/entity/Booklist.dart';
import 'package:sepiabooklist/generated/l10n.dart';

class ViewBookDetailPage extends StatelessWidget {
  ViewBookDetailPage({super.key,required this.booklist});
  final Booklist booklist;
  final List<String> titles = [S.current.title,S.current.author,S.current.page_count,S.current.isbn,S.current.publ_date,S.current.status,S.current.categories,S.current.description];
  @override
  Widget build(BuildContext context) {
    List<dynamic> desc = getBookDetailsData(booklist);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.book_details),
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

///This will set Book Detail Data which is selected from list
List<dynamic> getBookDetailsData(Booklist booklist) {
  List<dynamic> desc = [];
  desc.add(booklist.title ?? "",);
  desc.add(booklist.authors ?? "",);
  desc.add(booklist.pageCount ?? "",);
  desc.add(booklist.isbn ?? "",);
  desc.add(booklist.publishedDate ?? "",);
  desc.add(booklist.status ?? "",);
  desc.add(booklist.categories ?? "",);
  desc.add(booklist.longDescription ?? "",);

  return desc;
}
