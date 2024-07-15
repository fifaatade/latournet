import 'package:fintrackai/dashboard/AddDepense.dart';
import 'package:fintrackai/dashboard/dashboard.dart';
import 'package:fintrackai/dashboard/planifier.dart';
import 'package:fintrackai/dashboard/statistiques.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Others extends StatefulWidget {
  const Others({super.key});

  @override
  State<Others> createState() => _OthersState();
}

class _OthersState extends State<Others> {
  int _bottomNavIndex = 3;

  void _navigateToPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const Dashboard();
        break;
      case 1:
        page = const Planifier();
        break;
      case 2:
        page = const Statistiques();
        break;
      case 3:
        page = const Others();
        break;
      default:
        page = const Dashboard();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0XFF1E1E2D),
                    ),
                  ),
                ],
                title: const Text(
                  "Autres",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    color: Color(0XFF1E1E2D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddDepense(),
            ),
          );
        },
        child: const Icon(Icons.add_circle_outline),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 65,
        itemCount: 4,
        tabBuilder: (int index, bool isActive) {
          final iconList = [
            Icons.dashboard,
            Icons.data_saver_off_sharp,
            Icons.stacked_bar_chart_rounded,
            Icons.table_chart_rounded
          ];
          final textList = ['Dashboard', 'Planifier', 'Statistiques', 'Autres'];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  iconList[index],
                  size: 24,
                  color: isActive ? const Color(0XFF001752) : Colors.grey,
                ),
                Text(
                  textList[index],
                  style: TextStyle(
                    fontSize: 11,
                    color: isActive ? const Color(0XFF001752) : Colors.grey,
                  ),
                )
              ],
            ),
          );
        },
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        activeIndex: _bottomNavIndex,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
          if (index != 1) {
            _navigateToPage(index);
          }
        },
      ),
    );
  }
}
