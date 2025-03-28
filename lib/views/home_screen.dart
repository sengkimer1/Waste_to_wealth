import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:waste_to_wealth/controllers/activities_controller.dart';
import 'package:waste_to_wealth/controllers/points_controller.dart';
import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/models/points_model.dart';
import 'package:waste_to_wealth/views/activity_screen.dart';
import 'package:waste_to_wealth/views/reward.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:waste_to_wealth/views/pickup_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ActivitiesController _activitiesController = ActivitiesController();
  final PointsController _pointsController = PointsController();

  late Future<List<PointsModel>> _points;
  late Future<List<Activity>> _activities;

  @override
  void initState() {
    super.initState();
    _activities = _activitiesController.fetchActivities();
    _points = _pointsController.fetchPoint();
    // Fetch activities asynchronously
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            _buildChartData(),
            SizedBox(height: 15),
            _buildQuickAction(),
            SizedBox(height: 15),
            _button(context),
            SizedBox(height: 15),
            _Register(context),
            // FutureBuilder to display list of activities
            FutureBuilder<List<Activity>>(
              future: _activities,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No activities found.'));
                } else {
                  List<Activity> activities = snapshot.data!;
                  return ListView.separated(
                    itemCount: activities.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemBuilder: (context, index) {
                      Activity activity = activities[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star, size: 50, color: Colors.green),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            activity.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          activity.points,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF51BB20),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${activity.estimateWeight}Kg',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          timeago.format(
                                            activity.date,
                                            locale: 'hours',
                                          ),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding _Register(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Activities',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF2E553B),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF274CC7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/right-arrow.svg',
                  height: 24,
                  width: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActivityScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _button(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PickupScreen()),
              );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF51BB20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(150, 65),
          ),
          child: Text(
            'Schedule Pickup',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RewardPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2E553B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(150, 65),
          ),
          child: Text(
            'Redeem Point',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAction() {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: const [
          Text(
            'Quick Action',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartContainer() {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFFC5EBB3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Total Chart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Point',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: const Text(
                    'This Month',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(child: _buildLineChart()),
          ],
        ),
      ),
    );
  }

  Padding _buildChartData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text(
            'Total Point',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          FutureBuilder<List<PointsModel>>(
            future: _points,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available.'));
              } else {
                return Column(
                  children:
                      snapshot.data!.map((points) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              points.totalPoints,
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              points.cashEquivalent ,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                );
              }
            },
          ),
          const SizedBox(height: 5),
          _buildChartContainer(),
        ],
      ),
    );
  }

  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                List<String> months = [
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                ];
                int index = value.toInt();
                if (index >= 0 && index < months.length && value % 1 == 0) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      months[index],
                      style: const TextStyle(fontSize: 12),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              getTitlesWidget: (value, meta) {
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 500,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 100),
              FlSpot(1, 200),
              FlSpot(2, 390),
              FlSpot(3, 150),
              FlSpot(4, 300),
              FlSpot(5, 100),
              FlSpot(6, 200),
              FlSpot(7, 250),
            ],
            isCurved: true,
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.greenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.green.withOpacity(0.5),
                  Colors.greenAccent.withOpacity(0.1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }


  // Widget _buildChartContainer() {
  //   return Container(
  //     width: double.infinity,
  //     height: 300,
  //     decoration: BoxDecoration(
  //       color: const Color(0xFFC5EBB3),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: const [
  //                   Text(
  //                     'Total Chart',
  //                     style: TextStyle(
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   Text(
  //                     'Point', // Added "Point" below "Total Chart"
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w400,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 10.0), // Added margin
  //                 child: const Text(
  //                   'This Month',
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 8),
  //           Expanded(child: _buildLineChart()),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Padding _buildChartData() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         const SizedBox(height: 10),
  //         const Text(
  //           'Total Point',
  //           style: TextStyle(
  //             fontSize: 24,
  //             color: Colors.black,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: const [
  //             Text(
  //               '50',
  //               style: TextStyle(
  //                 fontSize: 32,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             Text(
  //               '\$1200',
  //               style: TextStyle(
  //                 fontSize: 15,
  //                 color: Colors.black,
  //                 fontWeight: FontWeight.w500,
  //               ),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 5),
  //         _buildChartContainer(),
  //       ],
  //     ),
  //   );
  // }

}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: const Text(
      'Waste To Wealth',
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF2E553B),
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/bell.svg',
            height: 24,
            width: 24,
          ),
          onPressed: () {
            // Handle notification click event
          },
        ),
      ),
    ],
  );
}
