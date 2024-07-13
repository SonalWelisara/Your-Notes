import 'package:flutter/material.dart';
import 'package:your_notes/features/model/note_model.dart';

Widget noteCard(BuildContext context, NoteModel note, bool selectionMode,
    List<String> selectedIndexes) {
  //print(selectionMode);
  //NoteModel note = boxNotes.getAt(index);
  //NoteModel note = noteList[index];
  return InkWell(
    child: Builder(builder: (context) {
      return Container(
        width: 200,
        decoration: (selectionMode && selectedIndexes.contains(note.key))
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
              )
            : BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 0.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.01),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
        padding: (selectionMode && selectedIndexes.contains(note.key))
            ? const EdgeInsets.only(left: 6, top: 4, right: 8, bottom: 6)
            : const EdgeInsets.only(left: 8, top: 6, right: 10, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (note.title.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Flexible(
                    child: Text(note.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            if (note.body.isNotEmpty)
              const SizedBox(
                height: 6,
              ),
            if (note.body.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Flexible(
                    child: Text(
                      note.body,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
    }),
  );
}
