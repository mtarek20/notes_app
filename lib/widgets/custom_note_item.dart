import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView(
              note: note,
            );
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
            color: const Color(0xffFFCC80),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();

                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(.4)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
