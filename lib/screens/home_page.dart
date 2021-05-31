import 'package:age/age.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/services/age_calculator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AgeDuration ageDuration;
  late AgeDuration birthDayDuration;
  DateTime todayDate = DateTime.now();
  List<String> months = [
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  DateTime dob = DateTime(1950, 1, 1);
  Future<void> _selectBirthday(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: DateTime(1950, 1, 1),
        lastDate: DateTime(2100, 1, 1));
    if (datePicked != null) {
      setState(() {
        dob = datePicked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ageDuration = AgeCalculator().calculateAge(todayDate, dob);
    birthDayDuration = AgeCalculator().nextBirthDay(todayDate, dob);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 30.0,
            width: double.maxFinite,
          ),
          Text(
            "Age Calculator",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Today",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${todayDate.day} ${months[todayDate.month]} ${todayDate.year}",
                      style: TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Birthday",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    Text(
                      "${dob.day} ${months[dob.month]} ${dob.year}",
                      style: TextStyle(
                          color: Colors.yellow, fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                        onTap: () async {
                          await _selectBirthday(context);
                          ageDuration =
                              AgeCalculator().calculateAge(todayDate, dob);
                          print(ageDuration);
                          birthDayDuration =
                              AgeCalculator().nextBirthDay(todayDate, dob);
                        },
                        child: Icon(Icons.calendar_today, color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80.0, 40.0, 20.0, 0.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${ageDuration.years}",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${ageDuration.months} Months | ${ageDuration.days} days",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next Birthday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Icon(
                        Icons.cake,
                        color: Colors.yellow,
                        size: 40.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "${birthDayDuration.months} Months | ${birthDayDuration.days} days",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            "SUMMARY",
            style: TextStyle(color: Colors.yellow, fontSize: 12.0),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Years",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "${ageDuration.years}",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Days",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "${todayDate.difference(dob).inDays}",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Months",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "${ageDuration.months + ageDuration.years * 12}",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Hours",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "${todayDate.difference(dob).inHours}",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Weaks",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "${(todayDate.difference(dob).inDays / 7).floor()}",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Mins",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                  Text(
                    "${todayDate.difference(dob).inMinutes}",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
