import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/boxNote.dart';
import 'package:your_notes/features/widget/buildNoteGrid.dart';
import 'package:your_notes/features/widget/note_card.dart';

import '../model/note_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _selectedKeyList = [];
  bool _selectionMode = false;

  List<NoteModel> _orderedNotes = [];
  List<NoteModel> _pinnedNotes = [];
  List<NoteModel> _unpinnedNotes = [];

  @override
  void initState() {
    super.initState();
    _getOrderedNotes();
  }

  void _getOrderedNotes() {
    // setState(() {
    //   _orderedNotes = boxNotes.values.cast<NoteModel>().toList();
    //   _orderedNotes.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    // });

    setState(() {
      _pinnedNotes = boxNotes.values
          .cast<NoteModel>()
          .where((note) => note.isHearted == true)
          .toList();
      _unpinnedNotes = boxNotes.values
          .cast<NoteModel>()
          .where((note) => note.isHearted == false)
          .toList();
      _pinnedNotes.sort((a, b) => b.dateTime.compareTo(a.dateTime));
      _unpinnedNotes.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    });
  }

  void _changeSelection({required bool enable, required String key}) {
    setState(() {
      _selectionMode = enable;
      _selectedKeyList.add(key);
      if (key == '-1') {
        _selectedKeyList.clear();
      }
      _getOrderedNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectionMode) ? _selectionAppbar() : _defaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (_pinnedNotes.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 12, bottom: 12),
                child: Text(
                  'Pinned',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            if (_pinnedNotes.isNotEmpty)
              NoteGrid(
                notes: _pinnedNotes,
                selectionMode: _selectionMode,
                selectedKeyList: _selectedKeyList,
                changeSelection: _changeSelection,
                onNoteGridChange: () {
                  setState(() {});
                },
                scrollable: false,
              ),
            if (_unpinnedNotes.isNotEmpty && _pinnedNotes.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 12, bottom: 12),
                child: Text(
                  'Others',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            if (_unpinnedNotes.isNotEmpty)
              NoteGrid(
                notes: _unpinnedNotes,
                selectionMode: _selectionMode,
                selectedKeyList: _selectedKeyList,
                changeSelection: _changeSelection,
                onNoteGridChange: () {
                  setState(() {});
                },
                scrollable: false,
              )
          ]),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            size: 36,
          ),
          onPressed: () {
            GoRouter.of(context).go('/createNote');
          },
        ),
      ),
    );
  }

  AppBar _defaultAppBar() {
    return AppBar(
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          setState(() {
            GoRouter.of(context).go('/search');
          });
        },
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(36),
          ),
          child: const Row(
            children: [
              Expanded(
                child: Text(
                  'Your Notes',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(Icons.search_rounded),
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
