import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../model/boxNote.dart';
import '../model/note_model.dart';

class ReadNote extends StatefulWidget{
  const ReadNote({super.key});
  @override
  State<StatefulWidget> createState() => _ReadNoteState();

}

class _ReadNoteState extends State {

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
        'key_${titleController.text}',    // *****must change
        NoteModel(
            title: titleController.text,
            body: bodyController.text,
            dateTime: DateFormat('yMd').format(DateTime.now()),
            isHearted: isPressed));
    //print(boxNotes.get('key_${titleController.text}').toString());
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('New Note'),
          backgroundColor: Colors.white,
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
                    color: (isPressed) ? const Color(0xff555555) : Colors.white,
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
              TextFormField(    // *****must change
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontSize: 26,
                    color: Color(0xff555555),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              TextFormField(   // *****must change
                controller: bodyController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note',
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Color(0xff555555),
                    )),
                style: const TextStyle(
                  color: Colors.black,
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