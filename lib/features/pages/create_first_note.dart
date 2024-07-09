import 'package:flutter/material.dart';
import 'package:your_notes/features/pages/create_note.dart';

class CreateFirstNote extends StatelessWidget{
  const CreateFirstNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/firstNote.png'),
              const SizedBox(height: 60,),
              const Column(
                children: [
                  Text(
                    'Create Your First Note',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    'Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 100,),
              GestureDetector(
                onTap: ()=>Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> const CreateNote()
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: const Center(
                    child: Text(
                      'Create A Note',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }

}