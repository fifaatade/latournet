import 'package:fintrackai/dashboard/AddDepense.dart';
import 'package:fintrackai/dashboard/dashboard.dart';
import 'package:fintrackai/dashboard/others.dart';
import 'package:fintrackai/dashboard/statistiques.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Planifier extends StatefulWidget {
  const Planifier({super.key});

  @override
  State<Planifier> createState() => _PlanifierState();
}

class _PlanifierState extends State<Planifier> {
  int _bottomNavIndex = 1;

  final events = [
    {
      "nom": "Paiements planifiés",
      "description": "Le lorem ipsum est ipsum",
      "avatar": "Facebook"
    },
    {
      "nom": "Budgets",
      "description": "Le lorem ipsum est ipsum",
      "avatar": "Facebook"
    },
    
  ];

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
                  "Planification",
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
              SizedBox(height: 20,),
              Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: events.map((e) => Padding(
                      padding: const EdgeInsets.only(bottom:10.0),
                      child: InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Statistiques(),
                          ))
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${e['nom']}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        color: Color(0XFF1A1D1E),
                                      ),
                                    ),
                                    Text(
                                      "${e['description']}",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        color: Color(0XFF6A6A6A),
                                      ),
                                    )
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/${e['avatar']}.png",
                                  fit: BoxFit.cover,
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ),
            )
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
