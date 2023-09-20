import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wasedatime/widgets/syllabus/syllabusfilters/schoolsfilters/schools_provider.dart';

class SchoolImageFilter extends ConsumerStatefulWidget {
  final String school;
  final List faculties;
  const SchoolImageFilter(
      {super.key, required this.school, required this.faculties});

  @override
  ConsumerState<SchoolImageFilter> createState() => _SchoolImageFilterState();
}

class _SchoolImageFilterState extends ConsumerState<SchoolImageFilter> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Map<String, bool> facultyGreyedOut =
        ref.watch(schoolsFilterNotifier)[widget.school]!;

    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: widget.faculties.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              ref
                  .read(schoolsFilterNotifier.notifier)
                  .updateSelectedSchoolFilter(
                      widget.school, widget.faculties[index]);
            },
            child: Card(
              child: Opacity(
                opacity: facultyGreyedOut[widget.faculties[index]] == false
                    ? 0.3
                    : 1,
                child: Image.asset(
                    height: size.height * 0.075,
                    width: size.width * 0.075,
                    'assets/images/schools/${widget.school}/${widget.faculties[index]}.png'),
              ),
            ),
          );
        });
  }
}
