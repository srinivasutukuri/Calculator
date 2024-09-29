import 'package:calculater_2/common/appbar.dart';
import 'package:calculater_2/common/button.dart';
import 'package:calculater_2/common/inputfield.dart';
import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/models/tasksmodel.dart';
import 'package:calculater_2/provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Editscreen extends StatefulWidget {
  const Editscreen({super.key, required this.index, required this.task});
  final int index;
  final TaskModel task;
  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: Cappbar(
          title: "Edit Task",
          leading: IconButton(
            onPressed: () {},
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
              Row(
                children: [
                  Expanded(
                    child: Button(
                      ontap: () {
                        provider.editTask(widget.task, widget.task, context);
                      },
                      title: "Update",
                      lagre: false,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Button(
                      ontap: () {
                        Navigator.pop(context);
                      },
                      title: "Cancel",
                      lagre: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
