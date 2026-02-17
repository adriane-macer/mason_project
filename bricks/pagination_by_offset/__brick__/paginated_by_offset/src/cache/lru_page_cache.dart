import 'dart:collection';

import '../../paginated_by_offset_barrel.dart';


class LruPageCache<T> {
  final int maxPages;
  final _map = LinkedHashMap<Object, PageEntry<T>>();

  LruPageCache({required this.maxPages});

  PageEntry<T>? get(Object key) {
    final value = _map.remove(key);
    if (value != null) {
      _map[key] = value;
    }
    return value;
  }

  void put(Object key, PageEntry<T> value) {
    if (_map.length >= maxPages) {
      _map.remove(_map.keys.first);
    }
    _map[key] = value;
  }

  void removeWhere(bool Function(Object key) test) {
    _map.removeWhere((key, _) => test(key));
  }

  List<T> mergePages() {
    final all = <T>[];
    for (final entry in _map.values) {
      all.addAll(entry.data);
    }
    return all;
  }
}
