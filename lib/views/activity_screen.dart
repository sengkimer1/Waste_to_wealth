import 'package:flutter/material.dart';
import 'package:waste_to_wealth/controllers/activity_controller.dart';
import 'package:waste_to_wealth/models/activity_model.dart'; // Your activity model
import 'package:waste_to_wealth/views/home_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final ActivityController _activityController = ActivityController();
  late Future<List<Activity>> _activities;

  @override
  void initState() {
    super.initState();
    _activities =
        _activityController
            .fetchActivitie(); // Fetch activities asynchronously

    _activities = _activityController.fetchActivitie(); // Fetch activities asynchronously
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Activity'),
      ),
      body: FutureBuilder<List<Activity>>(
        future: _activities, // Await the future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the data is being fetched
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error fetching data
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // If there are no activities returned
            return Center(child: Text('No activities found.'));
          } else {
            // When data is successfully fetched
            List<Activity> activities = snapshot.data!;

            return SingleChildScrollView(
              // This makes the entire screen scrollable
              child: Column(
                children: [
                  ListView.separated(
                    itemCount: activities.length,
                    shrinkWrap:
                        true, // Ensures the ListView does not take up all the available space
                    physics:
                        NeverScrollableScrollPhysics(), // Disable internal scrolling of ListView
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    itemBuilder: (context, index) {
                      Activity activity = activities[index];

                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4, // Adds a shadow to the card
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons
                                    .star, // Placeholder icon (replace with dynamic data if needed)
                                size: 50,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ), // Adds space between the icon and the text
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
                                            activity
                                                .title, // Display title from model
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          activity
                                              .points, // Display description from model
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF51BB20),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ), // Adds spacing between rows
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${activity.estimateWeight}Kg', // Show formatted date
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
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
