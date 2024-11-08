// The weather forecast (bonus)

import 'package:flutter/material.dart';

enum Weather {
  Sunny('assets/W4-Weather/sunny.png'),
  Rainy('assets/W4-Weather/rainy.png'),
  Cloudy('assets/W4-Weather/cloudy.png'),
  Snowy('assets/W4-Weather/snowy.png');

  final String image;
  const Weather(this.image);
}

enum DayOfWeek {
  Monday("Mon"),
  Tuesday("Tue"),
  Wednesday("Wed"),
  Thursday("Thu"),
  Friday("Fri"),
  Saturday("Sat"),
  Sunday("Sun");

  final String title;
  const DayOfWeek(this.title);
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: 140,
          child: Row(
            children: [
              CustomWeathers(
                day: DayOfWeek.Sunday,
                image: Weather.Sunny,
                maxTemp: 32,
                minTemp: 28,
              ),
              CustomWeathers(
                day: DayOfWeek.Monday,
                image: Weather.Cloudy,
                maxTemp: 28,
                minTemp: 22,
              ),
              CustomWeathers(
                day: DayOfWeek.Tuesday,
                image: Weather.Sunny,
                maxTemp: 36,
                minTemp: 20,
              ),
              CustomWeathers(
                day: DayOfWeek.Wednesday,
                image: Weather.Rainy,
                maxTemp: 22,
                minTemp: 18,
              ),
              CustomWeathers(
                day: DayOfWeek.Thursday,
                image: Weather.Sunny,
                maxTemp: 34,
                minTemp: 25,
              ),
              CustomWeathers(
                day: DayOfWeek.Friday,
                image: Weather.Snowy,
                maxTemp: 1,
                minTemp: -5,
              ),
              
              CustomWeathers(
                day: DayOfWeek.Saturday,
                image: Weather.Rainy,
                maxTemp: 24,
                minTemp: 18,
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}

class CustomWeathers extends StatelessWidget {
  // const CustomWeathers({
  //   super.key,
  // });
  final DayOfWeek day;
  final Weather image;
  final double maxTemp;
  final double minTemp;

  const CustomWeathers(
      {required this.day,
      required this.image,
      required this.maxTemp,
      required this.minTemp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Prevent overflow by minimizing column size
        children: [
          Text(
            day.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset(
            image.image,
            width: 30,
            height: 30,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${maxTemp}°', // Max temperature
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(width: 5), // Space between max and min temp
              Text(
                '${minTemp}°', // Min temperature
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
