import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../model/boxNote.dart';
import '../model/note_model.dart';

class ReadNote extends StatefulWidget{
  final int index;
  const ReadNote({super.key, required this.index});
  @override
  State<StatefulWidget> createState() => _ReadNoteState();

}

class _ReadNoteState extends State<ReadNote> {
  late NoteModel note;
  bool isPressed = false;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void initState() {
    note = boxNotes.getAt(widget.index);
    titleController.text=note.title;
    bodyController.text=note.body;
    isPressed=note.isHearted;
    super.initState();
  }

  void onBack(BuildContext context, bool didPop) async {
    if (didPop) {
      return;
    }
    if(titleController.text.isEmpty && bodyController.text.isEmpty){
      context.go('/home');
      return;
    }
    await boxNotes.putAt(
        widget.index,
        NoteModel(
            title: titleController.text,
            body: bodyController.text,
            dateTime: DateFormat('yMd').format(DateTime.now()),
            isHearted: isPressed));
    //print(boxNotes.get('key_${titleController.text}').toString());
    if (context.mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        onBack(context, didPop);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onBack(context, false);
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
              TextFormField(    // *****must change
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
              TextFormField(   // *****must change
                controller: bodyController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note',
                    hintStyle: TextStyle(
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