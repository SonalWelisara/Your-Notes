import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/boxNote.dart';
import 'package:your_notes/features/model/note_model.dart';
import 'package:your_notes/features/widget/buildNoteGrid.dart';

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

  void _changeSelection({required bool enable, required String key}) {
    setState(() {
      _selectionMode = enable;
      _selectedKeyList.add(key);
      if (key == '-1') {
        _selectedKeyList.clear();
      }
      _getSearchedNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (_selectionMode) ? _selectionAppbar() : _defaultAppBar(),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _searchFocus.unfocus();
          },
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child:
                  (_searchedNotes.isEmpty && searchController.text.isNotEmpty)
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
                      : NoteGrid(
                          notes: _searchedNotes,
                          selectionMode: _selectionMode,
                          selectedKeyList: _selectedKeyList,
                          changeSelection: _changeSelection,
                          onNoteGridChange: () {
                            setState(() {});
                          },
                          scrollable: true,
                        )),
        ));
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
