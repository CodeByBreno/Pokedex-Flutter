List<List<T>> getPages<T>(List<T> items, int itemsPerPage) {
  List<List<T>> pages = [];

  for (int i = 0; i < items.length; i += itemsPerPage) {
    int end = (i + itemsPerPage < items.length) ? i + itemsPerPage : items.length;
    pages.add(items.sublist(i, end));
  }

  return pages;
}