import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:your_notes/features/model/boxNote.dart';
import 'package:your_notes/features/model/note_model.dart';
import 'package:your_notes/features/widget/note_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(children: [
            MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: boxNotes.length,
                itemBuilder: (context, index)=>noteCard(context, boxNotes, index)),
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
}
