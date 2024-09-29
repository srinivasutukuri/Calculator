import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/contains/fonts.dart';
import 'package:calculater_2/contains/images.dart';
import 'package:calculater_2/models/tasksmodel.dart';
import 'package:calculater_2/provider/homeprovider.dart';

import 'package:calculater_2/views/Editscreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Task extends StatefulWidget {
  const Task({
    super.key,
    required this.index,
    required this.list,
    this.showoptions = true,
  });
  final bool showoptions;
  final int index;
  final List<TaskModel> list;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      TaskModel tasks = widget.list[widget.index];
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tasks.taskName,
                    style: TextStyle(
                      fontFamily: jost,
                      fontWeight: FontWeight.bold,
                      color: AppColors.translucentPeriwinkle,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      tasks.taskDetails,
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: jost,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (widget.showoptions)
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Editscreen(
                              task: tasks,
                              index: widget.index,
                            ),
                          ));
                    },
                    child: Image(
                      height: 27,
                      width: 28,
                      image: AssetImage(pencil),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      provider.deletetask(widget.index);
                    },
                    child: Image(
                      height: 23,
                      width: 24,
                      image: AssetImage(delete),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      provider.completdtask(tasks, widget.index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      height: 21,
                      width: 22,
                      decoration: BoxDecoration(
                        color: tasks.completed ? AppColors.translucentPeriwinkle : AppColors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.translucentPeriwinkle,
                        ),
                      ),
                      child: Center(
                        child: tasks.completed
                            ? const Icon(
                                Icons.check,
                                size: 15,
                                color: AppColors.white,
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20)
                ],
              ),
          ],
        ),
      );
    });
  }
}
