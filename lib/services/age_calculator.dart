import 'package:age/age.dart';

class AgeCalculator {
  AgeDuration calculateAge(DateTime today, DateTime birthday) {
    AgeDuration age;
    age = Age.dateDifference(
        fromDate: birthday, toDate: today, includeToDate: false);
    return age;
  }

  AgeDuration nextBirthDay(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBday = temp.isBefore(today)
        ? Age.add(date: temp, duration: AgeDuration(years: 1))
        : temp;
    AgeDuration nextBirthDayDuration =
        Age.dateDifference(fromDate: today, toDate: nextBday);
    return nextBirthDayDuration;
  }
}
