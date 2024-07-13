import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/boxNote.dart';
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

  @override
  void initState() {
    super.initState();
    _getOrderedNotes();
  }

  void _getOrderedNotes() {
    setState(() {
      _orderedNotes =boxNotes.values.cast<NoteModel>().toList();
      _orderedNotes.sort((a, b) => b.dateTime.compareTo(a.dateTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (_selectionMode) ? _selectionAppbar() : _defaultAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(children: [
            MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: _orderedNotes.length,
                itemBuilder: (context, index) {
                  final note = _orderedNotes[index];
                  //print(note.key);
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectionMode) {
                            if (_selectedKeyList.contains(note.key)) {
                              _selectedKeyList.remove(note.key);
                              if (_selectedKeyList.isEmpty) {
                                _changeSelection(enable: false, key: '-1');
                              }
                            } else {
                              _selectedKeyList.add(note.key);
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
                            _changeSelection(enable: true, key: note.key);
                          } else {
                            if (_selectedKeyList.contains(note.key)) {
                              _selectedKeyList.remove(note.key);
                              if (_selectedKeyList.isEmpty) {
                                _changeSelection(enable: false, key: '-1');
                              }
                            } else {
                              _selectedKeyList.add(note.key);
                            }
                          }
                        });
                      },
                      child: noteCard(
                          context, note, _selectionMode, _selectedKeyList));
                }),
            Positioned(
                width: 54,
                height: 54,
                bottom: 16,
                right: 16,
                child: Container(
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
                ))
          ]),
        ));
  }

  void _changeSelection({required bool enable, required String key}) {
    _selectionMode = enable;
    _selectedKeyList.add(key);
    if (key == '-1') {
      _selectedKeyList.clear();
    }
    _getOrderedNotes();
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
