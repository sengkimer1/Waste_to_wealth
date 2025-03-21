import 'package:flutter/material.dart';
import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/views/home_screen.dart';

class ActivityScreen extends StatefulWidget {
  // Constructor
  ActivityScreen({super.key});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<ActivityModel> activities = [];

  // Fetch initial activities when the screen is created
  @override
  void initState() {
    super.initState();
    _getInitialInfo();
  }

  void _getInitialInfo() {
    setState(() {
      activities = ActivityModel.getActivity(); // Fetching activities and updating the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Activity'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
           onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
        ),
      ),
      body: ListView.separated(
        itemCount: activities.length,
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
                    Icons.delete, // Use the delete icon
                    size: 40, // Set the icon size
                    color: Colors.green, // Set the icon color
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
                                activities[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 14, // Increased font size for readability
                                  overflow: TextOverflow.ellipsis, // Prevents overflow if the title is long
                                ),
                              ),
                            ),
                            Text(
                              activities[index].points,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF51BB20),
                                fontSize: 12, // Adjusted for consistency
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8), // Adds spacing between rows
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              activities[index].weight,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              activities[index].hours,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 12,
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
      ),
    );
  }
}
