import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:sepiabooklist/core/entity/Booklist.dart';

class ItemFetcher {

  final _itemsPerPage = 10;
  int _currentPage = 0;
  int _lastIndexed = 0;

  /// This async function simulates fetching results from Internet, etc.
  Future<List<Booklist>> fetch() async {
    final list = <Booklist>[];
    List<Booklist> lists = [];
    final String response =
    await rootBundle.loadString('assets/json/books.json');
    final data = await json.decode(response);
    List items = data;
    lists = items.map((val) => Booklist.fromJson(val)).toList();
    var count = lists.length;
    final n = min(_itemsPerPage, count - _currentPage * _itemsPerPage);
    await Future.delayed(const Duration(seconds: 1), () {
      for (int i = 0; i < n; i++) {
        list.add(lists[_lastIndexed+i]);
      }
    });
    _currentPage++;
    _lastIndexed = _currentPage+_itemsPerPage;
    return list;
  }
}