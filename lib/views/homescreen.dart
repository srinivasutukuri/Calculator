import 'package:calculater_2/contains/colors.dart';
import 'package:calculater_2/contains/enums.dart';
import 'package:calculater_2/provider/homeprovider.dart';
import 'package:calculater_2/views/completescreen.dart';
import 'package:calculater_2/views/taskscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      context.read<Homeprovider>().getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Homeprovider>(builder: (context, provider, _) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: provider.selectedtab.index,
          onTap: (index) {
            provider.changetab(index);
          },
          iconSize: 30,
          selectedItemColor: AppColors.translucentPeriwinkle,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "all",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: "Completed",
            ),
          ],
        ),
        body: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : switch (provider.selectedtab) {
                BottomBar.all => const Taskscreen(),
                BottomBar.complete => const Completedscreen(),
              },
      );
    });
  }
}
