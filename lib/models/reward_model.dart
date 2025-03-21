import 'package:flutter/material.dart';

class RewardModel {
  String title;
  IconData icon; // Changed from iconPath to icon (type IconData)
  String money;
  String points;
  bool viewIsSelected;
  Color boxColor;

  RewardModel({
    required this.title,
    required this.icon,
    required this.money,
    required this.points,
    required this.viewIsSelected,
    required this.boxColor,
  });

  static List<RewardModel> getReward() {
    return [
      RewardModel(
        title: 'Cash Voucher',
        icon: Icons.attach_money, // Correct IconData
        money: '\$500',
        points: '500 points',
        boxColor: Colors.white,
        viewIsSelected: true,
      ),
      RewardModel(
        title: 'Shopping Discount',
        icon: Icons.shopping_bag, // Correct IconData
        money: '20% OFF',
        points: '1000 points',
        boxColor: Colors.white,
        viewIsSelected: true,
      ),
      RewardModel(
        title: 'Free Pickup',
        icon: Icons.local_shipping, // Correct IconData
        money: '1 Service',
        points: '250 points',
        boxColor: Colors.white,
        viewIsSelected: true,
      ),
      RewardModel(
        title: 'Eco-friendly Products',
        icon: Icons.eco, // Correct IconData
        money: 'Gift Box',
        points: '750 points',
        boxColor: Colors.white,
        viewIsSelected: true,
      ),
    ];
  }
}
