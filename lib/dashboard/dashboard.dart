import 'package:fintrackai/dashboard/AddDepense.dart';
import 'package:fintrackai/dashboard/others.dart';
import 'package:fintrackai/dashboard/planifier.dart';
import 'package:fintrackai/dashboard/statistiques.dart';
import 'package:fintrackai/user_page/balance.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<_ChartData> barChartData;
  late List<_PieData> pieChartData;
  int _bottomNavIndex = 0;

  @override
  void initState() {
    super.initState();
    barChartData = [
      _ChartData('10/06', 10000, 5000),
      _ChartData('11/06', 10000, 6000),
      _ChartData('12/06', 10000, 7000),
      _ChartData('13/06', 10000, 8000),
      _ChartData('14/06', 10000, 9000),
      _ChartData('15/06', 10000, 10000),
      _ChartData('16/06', 10000, 11000),
      _ChartData('17/06', 10000, 12000),
    ];

    pieChartData = [
      _PieData('Dépot initial', 10000, const Color(0XFF4C78FF)),
      _PieData('Dépenses', 5000, const Color(0XFFFFBB38)),
      _PieData('Reste', 2000, const Color(0XFF16DBCC)),
      _PieData('Investissement', 3000, const Color(0XFFFF82AC)),
    ];
  }
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
                          builder: (context) => const Balance(),
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
                  "Dashboard",
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Balance(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Color(0XFF1E1E2D),
                    ),
                  ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.68,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: Image.asset("assets/images/Facebook.png"),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Espèces",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Poppins",
                                          color: Color(0XFF6A6A6A),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "10 000,00 XOF",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Poppins",
                                          color: Color(0XFF1A1D1E),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0XFF001752),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const AddDepense(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Aujourd'hui",
                                  style: TextStyle(
                                    color: Color(0XFFA2A2A7),
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  '10 000 FCFA',
                                  style: TextStyle(
                                      color: Color(0XFF1E1E2D),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 26,
                                      fontFamily: "Inter"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0XFF0033DA),
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Dépot",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color(0XFFFFAA0F),
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Dépenses",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Inter",
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Graphe à intégrer
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SfCartesianChart(
                              primaryXAxis: const CategoryAxis(),
                              primaryYAxis: const NumericAxis(
                                majorGridLines: MajorGridLines(color: Color(0xFFDFE5EE)),
                              ),
                              series: <CartesianSeries>[
                                ColumnSeries<_ChartData, String>(
                                  name: 'Dépot',
                                  dataSource: barChartData,
                                  xValueMapper: (_ChartData data, _) => data.date,
                                  yValueMapper: (_ChartData data, _) => data.depot,
                                  color: const Color(0XFF0033DA),
                                ),
                                ColumnSeries<_ChartData, String>(
                                  name: 'Dépenses',
                                  dataSource: barChartData,
                                  xValueMapper: (_ChartData data, _) => data.date,
                                  yValueMapper: (_ChartData data, _) => data.depenses,
                                  color: const Color(0XFFFFAA0F),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20.0,right:20),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                           

                            child: SfCircularChart(
                              legend: Legend(
                                isVisible: true,
                                overflowMode: LegendItemOverflowMode.wrap,
                                position: LegendPosition.bottom,
                                itemPadding: 15,
                              ),
                              series: <CircularSeries>[
                                DoughnutSeries<_PieData, String>(
                                  dataSource: pieChartData,
                                  pointColorMapper: (_PieData data, _) => data.color,
                                  xValueMapper: (_PieData data, _) => data.category,
                                  yValueMapper: (_PieData data, _) => data.amount,
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Trop de dépenses",
                                    style: TextStyle(
                                      color: Color(0XFF001752),
                                      fontFamily: "Lexend",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Color(0XFF9FB2F2),
                                  height: 0.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0, horizontal: 20),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/depense.png"),
                                        const Text(
                                          "Pas de frais",
                                          style: TextStyle(
                                            color: Color(0XFF333333),
                                            fontFamily: "Lexend",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Text(
                                          "Ajoutez votre premier enregistrement pour afficher les dépenses les plus élevées",
                                          style: TextStyle(
                                            color: Color(0XFF919191),
                                            fontFamily: "Lexend",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    "Derniers enregistrements",
                                    style: TextStyle(
                                      color: Color(0XFF001752),
                                      fontFamily: "Lexend",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Color(0XFF9FB2F2),
                                  height: 0.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0, horizontal: 20),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/occurence.png"),
                                        const Text(
                                          "Aucune occurrence",
                                          style: TextStyle(
                                            color: Color(0XFF333333),
                                            fontFamily: "Lexend",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Text(
                                          "Ajoutez votre premier enregistrement pour afficher les dépenses les plus élevées",
                                          style: TextStyle(
                                            color: Color(0XFF919191),
                                            fontFamily: "Lexend",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
        child: Icon(Icons.add_circle_outline),
        shape: CircleBorder(), // Icone du FloatingActionButton
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 65,
        itemCount: 4, // Nombre d'icônes dans la barre de navigation
        tabBuilder: (int index, bool isActive) {
          final iconList = [
            Icons.dashboard,
            Icons.data_saver_off_sharp,
            Icons.stacked_bar_chart_rounded,
            Icons.table_chart_rounded
          ];
          final textList = [
            'Dashboard',
            'Planifier',
            'Statistiques',
            'Autres'
          ]; // Étiquettes pour chaque icône
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  iconList[index],
                  size: 24,
                  color: isActive ? Color(0XFF001752) : Colors.grey,
                ),
                Text(
                  textList[index], // Texte sous l'icône
                  style: TextStyle(
                    fontSize: 11,
                    color: isActive ? Color(0XFF001752)  : Color(0XFF001752) ,
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
          _navigateToPage(index);
        },
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.date, this.depot, this.depenses);

  final String date;
  final double depot;
  final double depenses;
}

class _PieData {
  _PieData(this.category, this.amount, this.color);

  final String category;
  final double amount;
  final Color color;
}
