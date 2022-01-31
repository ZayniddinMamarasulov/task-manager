import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../cubit/task_type_cubit.dart';
import '../../../cubit/task_type_items.dart';
import '../../../cubit/task_type_state.dart';

class TaskTypeList extends StatefulWidget {
  TaskTypeList({Key? key}) : super(key: key);

  @override
  State<TaskTypeList> createState() => _TaskTypeListState();
}

class _TaskTypeListState extends State<TaskTypeList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: BlocBuilder<TaskTypeCubit, TaskTypeState>(
        builder: (context, state) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  width: (MediaQuery.of(context).size.width /
                      TaskTypeItems.values.length),
                  child: TextButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(2),
                        backgroundColor: MaterialStateProperty.all(
                          state.index == index
                              ? Colors.white
                              : Theme.of(context).cardColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {
                      BlocProvider.of<TaskTypeCubit>(context)
                          .getTaskTypes(TaskTypeItems.values[index]);
                    },
                    child: Text(
                      index == 0
                          ? "My Task"
                          : index == 1
                              ? "In-progress"
                              : "Completed",
                      style: GoogleFonts.poppins(
                        textStyle: state.index == index
                            ? Theme.of(context).textTheme.headline1
                            : Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                );
              },
              itemCount: TaskTypeItems.values.length);
        },
      ),
    );
  }
}
