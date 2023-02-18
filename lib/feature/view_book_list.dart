
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sepiabooklist/core/entity/Booklist.dart';
import 'package:sepiabooklist/core/utils/utility.dart';
import 'package:sepiabooklist/feature/view_book_detail.dart';
import 'package:sepiabooklist/feature/view_book_home.dart';
import 'package:sepiabooklist/generated/l10n.dart';

class ViewBookListPageState extends State<ViewBookHomePage> {
  List<Booklist> booklist = [];
  final _itemFetcher = ItemFetcher();
  bool _isLoading = true;
  bool _hasMore = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    _hasMore = true;
    _loadMore();
  }

  /// Triggers fecth() and then add new items or change _hasMore flag
  void _loadMore() {
    _isLoading = true;
    _itemFetcher.fetch().then((List<Booklist> fetchedList) {
      if (fetchedList.isEmpty) {
        setState(() {
          _isLoading = false;
          _hasMore = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          booklist.addAll(fetchedList);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.book_list),
      ),
      body: ListView.separated(
        itemCount: _hasMore ? booklist.length + 1 : booklist.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (index >= booklist.length) {
            /// Don't trigger if one async loading is already under way
            if (!_isLoading) {
              _loadMore();
            }
            return const Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
            );
          }
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
                child: CachedNetworkImage(
                  height: double.infinity,
                  width: double.infinity,
                  imageUrl: booklist[index].thumbnailUrl??"",
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
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
