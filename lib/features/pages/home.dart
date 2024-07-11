import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/boxNote.dart';
import 'package:your_notes/features/widget/note_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<int> _selectedIndexList = [];
  bool _selectionMode = false;

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
                itemCount: boxNotes.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectionMode) {
                          if (_selectedIndexList.contains(index)) {
                            _selectedIndexList.remove(index);
                            print(_selectedIndexList);
                            if (_selectedIndexList.isEmpty) {
                              _changeSelection(enable: false, index: -1);
                              print(_selectedIndexList);
                            }
                          } else {
                            _selectedIndexList.add(index);
                            print(_selectedIndexList);
                          }
                        } else {
                          GoRouter.of(context).go('/readNote', extra: index);
                        }
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        if (!_selectionMode) {
                          _changeSelection(enable: true, index: index);
                          print(_selectedIndexList);
                        } else {
                          if (_selectedIndexList.contains(index)) {
                            _selectedIndexList.remove(index);
                            print(_selectedIndexList);
                            if (_selectedIndexList.isEmpty) {
                              _changeSelection(enable: false, index: -1);
                              print(_selectedIndexList);
                            }
                          } else {
                            _selectedIndexList.add(index);
                            print(_selectedIndexList);
                          }
                        }
                      });
                    },
                    child: noteCard(context, boxNotes, index, _selectionMode,
                        _selectedIndexList))),
            Positioned(
                left: 0,
                right: 0,
                bottom: 16,
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    context.go('/createNote');
                  },
                ))
          ]),
        ));
  }

  void _changeSelection({required bool enable, required int index}) {
    _selectionMode = enable;
    _selectedIndexList.add(index);
    if (index == -1) {
      _selectedIndexList.clear();
    }
  }

  AppBar _defaultAppBar() {
    return AppBar(
      centerTitle: true,
      title: GestureDetector(
        onTap: () {},
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
                  'Search your notes',
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
            _changeSelection(enable: false, index: -1);
          });
        },
      ),
      title: Text(
        _selectedIndexList.length.toString(),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline))
      ],
    );
  }
}
