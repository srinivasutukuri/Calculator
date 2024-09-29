import 'package:calculater_2/common/appbar.dart';
import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/contains/fonts.dart';
import 'package:calculater_2/contains/images.dart';
import 'package:calculater_2/provider/homeprovider.dart';
import 'package:calculater_2/views/addtaskscreen.dart';
import 'package:calculater_2/views/companents/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  int today = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: Cappbar(
          title: "TODO APP",
          actions: [
            Stack(
              children: [
                Image(height: 35, width: 35, image: AssetImage(calender)),
                Positioned(
                  left: 8,
                  top: 7,
                  child: Text(
                    today.toString(),
                    style: TextStyle(
                      fontFamily: jost,
                      fontWeight: FontWeight.normal,
                      color: AppColors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        backgroundColor: AppColors.periwinkle,
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: AppColors.translucentPeriwinkle,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Addtaskscreen(),
                ),
              );
            },
            shape: const CircleBorder(),
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: provider.lsttasks.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Task(
                      index: index,
                      list: provider.lsttasks,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
