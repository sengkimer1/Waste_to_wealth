import 'package:flutter/material.dart';
import 'package:waste_to_wealth/views/reward.dart';

class PopupScreen extends StatelessWidget {
  const PopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        width: 430,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Cash out',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            // Points row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Points', style: TextStyle()),
                    Text('(20)', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const Text(
                  '\$100',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Balance Amount row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Balance Amount',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),

                    Text('(30%)', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '\$100',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text('\$20', style: TextStyle(fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Withdraw button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D5D42),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RewardPage()),
                      );
                    },
                
                child: const Text(
                  'Widraw',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example of how to show this dialog
void showPopupScreen(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const PopupScreen();
    },
  );
}
