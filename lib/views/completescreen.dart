import 'package:calculater_2/common/appbar.dart';
import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/provider/homeprovider.dart';
import 'package:calculater_2/views/companents/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Completedscreen extends StatefulWidget {
  const Completedscreen({super.key});

  @override
  State<Completedscreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Completedscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      context.read<Homeprovider>().getCompletedtasks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        appBar: const Cappbar(
          title: "Completed Task",
        ),
        backgroundColor: AppColors.periwinkle,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: provider.listcompleted.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Task(
                      index: index,
                      showoptions: false,
                      list: provider.listcompleted,
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
