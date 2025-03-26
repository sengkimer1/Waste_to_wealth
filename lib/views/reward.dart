import 'package:flutter/material.dart';
import 'package:waste_to_wealth/models/reward_model.dart';
import 'package:waste_to_wealth/views/popup_screen.dart';

class RewardPage extends StatefulWidget {
  const RewardPage({super.key});

  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  List<RewardModel> rewards = [];

  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      rewards = RewardModel.getReward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _rewardHeader(),
            _BoxReward(),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.only(right: 280),
              child: Text(
                'All Rewards',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  final reward = rewards[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                      color: reward.boxColor.withOpacity(0.1),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          rewards[index].icon, // Get the icon from the model
                          size: 50,
                          color: Colors.green,
                        ),
                        Column(
                          children: [
                            Text(
                              reward.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              reward.money,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              reward.points,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2E553B),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("Redeem"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _BoxReward() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFC5EBB3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              const Text(
                "Current Point",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "100 Point",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E553B),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 160,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Handle cash out action
                  },
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PopupScreen()),
                      );
                    },
                    child: const Text(
                      "Cash out",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rewardHeader() {
    return const Column(
      children: [
        Text(
          'Rewards',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  AppBar _appBar() {
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
      centerTitle: false,
      // leading: GestureDetector(
      //   onTap: () {},
      //   child: Container(
      //     margin: EdgeInsets.only(left: 10),
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      //     child: IconButton(
      //       icon: Icon(Icons.arrow_back, color: Color(0xFF086C74)),
      //       onPressed: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => HomeScreen()),
      //         );
      //       },
      //     ),
      //   ),
      // ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(Icons.history, color: Color(0xFF086C74)),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SocialWidget(),
                //   ),
                // );
              },
            ),
          ),
        ),
      ],
    );
  }
}
