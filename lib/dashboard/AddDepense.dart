import 'package:fintrackai/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AddDepense extends StatefulWidget {
  const AddDepense({super.key});

  @override
  State<AddDepense> createState() => _AddDepenseState();
}

class _AddDepenseState extends State<AddDepense> {
  late List<_ChartData> barChartData;

  @override
  void initState() {
    super.initState();
    barChartData = [
      _ChartData('19/05', 10000, 5000),
      _ChartData('20/05', 10000, 6000),
      _ChartData('21/05', 10000, 7000),
      _ChartData('22/05', 10000, 8000),
      _ChartData('23/05', 10000, 9000),
      _ChartData('24/05', 10000, 10000),
      _ChartData('25/05', 11000, 10000),
    ];
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
                      Navigator.pop(context);
                    },
                    icon: Image.asset(
                      'assets/images/edit.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
                title: const Text(
                  "Espèces",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Poppins",
                    color: Color(0XFF1E1E2D),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                centerTitle: true,
                leading: 
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
                        padding: const EdgeInsets.all(15.0),
                        child: Card(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Les derniers jours",
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
                              Padding(
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
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/add.png',
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Aucune donnée dans ce compte",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF333333),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: "Lexend",
                            ),
                          ),

                          const SizedBox(height: 10),
                          const Text(
                            "Ajoutez votre premier enregistrement",
                            style: TextStyle(
                              color: Color(0xFF919191),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              fontFamily: "Lexend"
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Action for the transaction button
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: const Color(0XFF001752),
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Transaction",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Lexend",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 8), // Ajoute un espace entre le texte et l'icône
                                Icon(Icons.add_circle_outline, color: Colors.white),
                              ],
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * .1),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
