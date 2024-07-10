import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/note_model.dart';

Widget noteCard(BuildContext context, boxNotes, index) {
  NoteModel note = boxNotes.getAt(index);
  return InkWell(
    onTap: () {
      context.go('/createNote');
    },
    child: Container(
      //height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: const Color(0xff6e6f71)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 8, top: 6, right: 10, bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if(note.title.isNotEmpty)
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
                      // color:
                      // Theme.of(context).colorScheme.primaryContainer
                    ),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          if(note.body.isNotEmpty)
          const SizedBox(
            height: 6,
          ),
          if(note.body.isNotEmpty)
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
    ),
  );
}
