import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:waste_to_wealth/models/register_model.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<RegisterModel> register = [];

  void _getInitialInfo() {
    register = RegisterModel.getRegister();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: _buildAppBar(),

      body: Container(
        color: Colors.white, // Background color
        child: Column(
          children: [
            _buildChartData(),
            SizedBox(height: 20),
            _buildQuickAction(),
            SizedBox(height: 20),
            _button(),
            SizedBox(height: 20),
            _Register(),
ListView.separated(
  itemCount: register.length,
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
  separatorBuilder: (context, index) => SizedBox(height: 20), 
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
  itemBuilder: (context, index) {
    return Container(
      decoration: BoxDecoration(
  color: register[index].boxIsSelected ? Colors.white : Colors.white, 
  borderRadius: BorderRadius.circular(8),
  border: Border.all(
    color: const Color.fromARGB(255, 97, 184, 100),
    width: 1
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.09),
      offset: Offset(30, 30),
      blurRadius: 40,
      spreadRadius: 0,
    ),
  ],
),

      padding: EdgeInsets.symmetric(vertical: 12), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Proper spacing
        children: [
          SvgPicture.asset(register[index].iconPath, width: 65),
          
          Expanded( // Ensures Column expands properly
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Title & Points aligned
                  children: [
                    Text(
                      register[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      register[index].points,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF51BB20),
                        fontSize: 10,
                      ),
                    ),

                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                  register[index].weight,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                  // Title & Points aligned
                
                Text(
                  register[index].hours,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 10,
                  ),
                ),
                  ],
                ),
              
              ],
              
            ),
          ),
        
          SvgPicture.asset('assets/icons/trush-square.svg', width: 20, height: 20),
        ],
      ),
    );
  },
),

          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding _Register() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            'Register',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF2E553B),
              fontWeight: FontWeight.bold,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
                  // Handle notification click event
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF51BB20), // Button color
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF2E553B), // Button color
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

  /// Line Chart Data
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
        maxY: 50,
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 10),
              FlSpot(1, 30),
              FlSpot(2, 15),
              FlSpot(3, 25),
              FlSpot(4, 10),
              FlSpot(5, 45),
              FlSpot(6, 20),
              FlSpot(7, 25),
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
                      'Point', // Added "Point" below "Total Chart"
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0), // Added margin
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
          const SizedBox(height: 30),
          const Text(
            'Total Point',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '50',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$1200',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildChartContainer(),
        ],
      ),
    );
  }
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
