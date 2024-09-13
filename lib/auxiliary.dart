List<List<String>> getPages(List<String> _items, int itemsPerPage) {
  List<List<String>> pages = [];

  for (int i = 0; i < _items.length; i += itemsPerPage) {
    int end = (i + itemsPerPage < _items.length) ? i + itemsPerPage : _items.length;
    pages.add(_items.sublist(i, end));
  }

  return pages;
}