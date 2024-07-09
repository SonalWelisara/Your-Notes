import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget{
  const CreateNote({super.key});
  @override
  State<StatefulWidget> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote>{

  bool isPressed = false;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Note'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isPressed = !isPressed;
              });
            },
            icon: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Color(0xff555555),
                  size: 27,
                ),
                Icon(
                  Icons.favorite,
                  color: (isPressed) ? const Color(0xff555555) : Colors.white,
                ),
              ]
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextFormField(
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
            TextFormField(
              controller: bodyController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note',
                hintStyle: TextStyle(
                  fontSize: 22,
                  color: Color(0xff555555),
                )
              ),
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

    );
  }
}