import 'package:calculater_2/common/appbar.dart';
import 'package:calculater_2/common/button.dart';
import 'package:calculater_2/common/inputfield.dart';
import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addtaskscreen extends StatefulWidget {
  const Addtaskscreen({super.key});

  @override
  State<Addtaskscreen> createState() => _AddtaskscreenState();
}

class _AddtaskscreenState extends State<Addtaskscreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: Cappbar(
          title: "Add Task",
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Inputfield(title: "Title", titlecontroler: provider.titlecontroler),
              const SizedBox(height: 30),
              Inputfield(title: "Detail", titlecontroler: provider.detailscontroler),
              const SizedBox(height: 50),
              Button(
                ontap: () {
                  provider.createTask();
                  provider.addtask(context);
                },
                title: "Add",
              )
            ],
          ),
        ),
      );
    });
  }
}
