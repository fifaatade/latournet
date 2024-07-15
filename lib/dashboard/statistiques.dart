import 'package:fintrackai/dashboard/AddDepense.dart';
import 'package:fintrackai/dashboard/dashboard.dart';
import 'package:fintrackai/dashboard/others.dart';
import 'package:fintrackai/dashboard/planifier.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Statistiques extends StatefulWidget {
  const Statistiques({super.key});

  @override
  State<Statistiques> createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
  int _bottomNavIndex = 2;
  int _selectedDayIndex = 0;
  final int _selectedSlideIndex = 0;

  final events = [
    {
      "nom": "Solde",
      "description": "10.000 FCFA",
      "avatar": "img1"
    },
    {
      "nom": "Dépenses",
      "description": "0.00 FCFA",
      "avatar": "img2"
    },
    {
      "nom": "Flux de trésorerie",
      "description": "0.00 FCFA",
      "avatar": "img3"
    },
    {
      "nom": "Aperçu",
      "description": "0.00 FCFA",
      "avatar": "img4"
    },
    {
      "nom": "Crédit",
      "description": "0.00 FCFA",
      "avatar": "img5"
    },
    {
      "nom": "Etude revenus",
      "description": "0.00 FCFA",
      "avatar": "img6"
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
                  "Statistiques",
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
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(5, (index) {
                          final labels = ["7 jours", "30 jours", "12 sem.", "6 mois", "1 an"];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDayIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: _selectedDayIndex == index ? const Color(0XFF001752) : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                labels[index],
                                style: TextStyle(
                                  color: _selectedDayIndex == index ? Colors.white : Colors.black,
                                  fontWeight: _selectedDayIndex == index ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: CircleAvatar(
                            radius: 3,
                            backgroundColor: _selectedSlideIndex == index ? const Color(0xFF565656) : const Color(0xFFD9D9D9),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: events.map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: InkWell(
                          onTap: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Planifier(),
                            ))
                          },
                          child: Card(
                            elevation: 0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e['nom']}",
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF6A6A6A),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${e['description']}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          color: Color(0XFF1A1D1E),
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
