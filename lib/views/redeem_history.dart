import 'package:flutter/material.dart';
import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/models/redeemHistory_model.dart';
import 'package:waste_to_wealth/views/home_screen.dart';
import 'package:waste_to_wealth/views/reward.dart';

class RedeemHistory extends StatefulWidget {
  // Constructor
  RedeemHistory({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<RedeemHistory> {
  List<RedeemhistoryModel> redeem_history = [];

  // Fetch initial redeem_history when the screen is created
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      redeem_history = RedeemhistoryModel.getRedeemHistory();// Fetching redeem_history and updating the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Redeem History'),
       
      ),
      body: ListView.separated(
        itemCount: redeem_history.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 4, // Adds a shadow to the card
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                 Icon(
                          redeem_history[index].icon, // Get the icon from the model
                          size: 50,
                          color: Colors.green,
                        ),
                  SizedBox(width: 8), // Adds space between the icon and the text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                redeem_history[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 14, // Increased font size for readability
                                  overflow: TextOverflow.ellipsis, // Prevents overflow if the title is long
                                ),
                              ),
                            ),
                            Text(
                              redeem_history[index].promoteCode,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF51BB20),
                                fontSize: 12, // Adjusted for consistency
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8), // Adds spacing between rows
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
