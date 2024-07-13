import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../model/boxNote.dart';
import '../model/note_model.dart';
import '../widget/note_card.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> _selectedKeyList = [];
  bool _selectionMode = false;
  final searchController = TextEditingController();
  late FocusNode _searchFocus;
  List<NoteModel> _searchedNotes = [];

  @override
  void initState() {
    super.initState();
    _searchFocus = FocusNode();
    searchController.addListener(_onSearchChanged);
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(_searchFocus);
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    _searchFocus.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _getSearchedNotes();
  }

  void _getSearchedNotes() {
    setState(() {
      String query = searchController.text.toLowerCase();
      if (query.isEmpty) {
        _searchedNotes.clear();
      } else {
        _searchedNotes = boxNotes.values
            .cast<NoteModel>()
            .where((note) =>
                note.title.toLowerCase().contains(query) ||
                note.body.toLowerCase().contains(query))
            .toList();
        _searchedNotes.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (_selectionMode) ? _selectionAppbar() : _defaultAppBar(),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              FocusScope.of(context).unfocus();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: (_searchedNotes.isEmpty && searchController.text.isNotEmpty)
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 64,
                        ),
                        Text('No matching notes')
                      ],
                    ),
                  )
                : Stack(children: [
                    MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemCount: _searchedNotes.length,
                        itemBuilder: (context, index) {
                          final note = _searchedNotes[index];
                          //print(note.key);
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_selectionMode) {
                                    if (_selectedKeyList.contains(note.key)) {
                                      _selectedKeyList.remove(note.key);
                                      print(_selectedKeyList);
                                      if (_selectedKeyList.isEmpty) {
                                        _changeSelection(
                                            enable: false, key: '-1');
                                        print(_selectedKeyList);
                                      }
                                    } else {
                                      _selectedKeyList.add(note.key);
                                      print(_selectedKeyList);
                                    }
                                  } else {
                                    GoRouter.of(context)
                                        .go('/readNote', extra: note.key);
                                  }
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  if (!_selectionMode) {
                                    _changeSelection(
                                        enable: true, key: note.key);
                                    print(_selectedKeyList);
                                  } else {
                                    if (_selectedKeyList.contains(note.key)) {
                                      _selectedKeyList.remove(note.key);
                                      print(_selectedKeyList);
                                      if (_selectedKeyList.isEmpty) {
                                        _changeSelection(
                                            enable: false, key: '-1');
                                        print(_selectedKeyList);
                                      }
                                    } else {
                                      _selectedKeyList.add(note.key);
                                      print(_selectedKeyList);
                                    }
                                  }
                                });
                              },
                              child: noteCard(context, note, _selectionMode,
                                  _selectedKeyList));
                        }),
                  ]),
          ),
        ));
  }

  void _changeSelection({required bool enable, required String key}) {
    _selectionMode = enable;
    _selectedKeyList.add(key);
    if (key == '-1') {
      _selectedKeyList.clear();
    }
    _getSearchedNotes();
  }

  AppBar _defaultAppBar() {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          setState(() {
            GoRouter.of(context).go('/home');
          });
        },
        icon: const Icon(Icons.arrow_back),
      ),
      title: GestureDetector(
        onTap: () {},
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                controller: searchController,
                focusNode: _searchFocus,
                decoration: const InputDecoration(
                    hintText: 'Search your notes', border: InputBorder.none),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              )),
              IconButton(
                  onPressed: () {
                    searchController.clear();
                    _searchedNotes.clear();
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
        ),
      ),
    );
  }

  AppBar _selectionAppbar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          setState(() {
            _changeSelection(enable: false, key: '-1');
          });
        },
      ),
      title: Text(
        _selectedKeyList.length.toString(),
      ),
      actions: [
        IconButton(
            onPressed: () async {
              for (var i in _selectedKeyList) {
                await boxNotes.delete(i);
              }
              _changeSelection(enable: false, key: '-1');
              setState(() {});
            },
            icon: const Icon(Icons.delete_outline))
      ],
    );
  }
}
