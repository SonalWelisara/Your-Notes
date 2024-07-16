import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/note_model.dart';
import 'package:your_notes/features/widget/note_card.dart';

class NoteGrid extends StatefulWidget {
  final List<NoteModel> notes;
  final bool selectionMode;
  final List<String> selectedKeyList;
  final Function({required bool enable, required String key}) changeSelection;
  final VoidCallback onNoteGridChange;
  final bool scrollable;

  const NoteGrid(
      {super.key,
      required this.notes,
      required this.selectionMode,
      required this.selectedKeyList,
      required this.changeSelection,
      required this.onNoteGridChange,
      required this.scrollable});

  @override
  State<NoteGrid> createState() => _NoteGridState();
}

class _NoteGridState extends State<NoteGrid> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        shrinkWrap: (widget.scrollable) ? false : true,
        physics: (widget.scrollable)
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: widget.notes.length,
        itemBuilder: (context, index) {
          final note = widget.notes[index];
          return GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.selectionMode) {
                    if (widget.selectedKeyList.contains(note.key)) {
                      widget.selectedKeyList.remove(note.key);
                      if (widget.selectedKeyList.isEmpty) {
                        widget.changeSelection(enable: false, key: '-1');
                      }
                    } else {
                      widget.selectedKeyList.add(note.key);
                    }
                  } else {
                    GoRouter.of(context).go('/readNote', extra: note.key);
                  }
                });
                widget.onNoteGridChange();
              },
              onLongPress: () {
                setState(() {
                  if (!widget.selectionMode) {
                    widget.changeSelection(enable: true, key: note.key);
                  } else {
                    if (widget.selectedKeyList.contains(note.key)) {
                      widget.selectedKeyList.remove(note.key);
                      if (widget.selectedKeyList.isEmpty) {
                        widget.changeSelection(enable: false, key: '-1');
                      }
                    } else {
                      widget.selectedKeyList.add(note.key);
                    }
                  }
                });
                widget.onNoteGridChange();
              },
              child: noteCard(
                  context, note, widget.selectionMode, widget.selectedKeyList));
        });
  }
}
