import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:your_notes/features/model/boxNote.dart';
import 'package:your_notes/features/model/note_model.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<StatefulWidget> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  bool isPressed = false;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  onBack(didPop) {
    if (didPop) {
      return;
    }
    if(titleController.text.isEmpty && bodyController.text.isEmpty){
      context.go('/home');
      return;
    }
    boxNotes.put(
        'key_${titleController.text}',
        NoteModel(
            title: titleController.text,
            body: bodyController.text,
            dateTime: DateFormat('yMd').format(DateTime.now()),
            isHearted: isPressed));
    print(boxNotes.get('key_${titleController.text}').toString());
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        onBack(didPop);
      },
      child: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          title: const Text('New Note'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onBack(false);
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                icon: Stack(alignment: Alignment.center, children: [
                  const Icon(
                    Icons.favorite,
                    color: Color(0xff555555),
                    size: 27,
                  ),
                  Icon(
                    Icons.favorite,
                    color: (isPressed) ? const Color(0xff555555) : Theme.of(context).colorScheme.surface,
                  ),
                ]),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 26,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 26,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              TextFormField(
                controller: bodyController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note',
                    hintStyle: TextStyle(
                      fontSize: 22,
                    )),
                style: const TextStyle(
                  fontSize: 22,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
