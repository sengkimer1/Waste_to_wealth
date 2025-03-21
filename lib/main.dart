import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waste_to_wealth/bloc/user_bloc.dart';
import 'package:waste_to_wealth/components/navigate_menu.dart';
import 'package:waste_to_wealth/models/activity_model.dart';
import 'package:waste_to_wealth/views/activity_screen.dart';
import 'package:waste_to_wealth/views/home_screen.dart';
import 'package:waste_to_wealth/views/login_screen.dart';
import 'package:waste_to_wealth/views/reward.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Waste to Wealth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home:  RewardPage(), // Change this to HomePage() if needed
      ),
    );
  }
}
