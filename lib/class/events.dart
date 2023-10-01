import 'package:intl/intl.dart';

class Event {
  final String date;
  final String time;
  final String title;
  final String description;
  bool isComplete = false;
  // final String image;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.isComplete = false,
  });

  String getFormattedDate(dateTimeVar) {
    return DateFormat('yyyy-MM-dd').format(dateTimeVar);
  }

  String getFormattedTime(timeVar) {
    return "${timeVar.hour}:${timeVar.minute}";
  }
}

List<Event> eventsNew = [
  Event(
    title: "Read a Book",
    date: "2023-09-19",
    time: "15:30",
    description: 'Read one from the Harry Potter series',
    isComplete: false,
  ),
  Event(
    title: "Study Coding",
    date: "2023-09-20",
    time: "17:30",
    description: 'Study coding for 2 hours',
    isComplete: false,
  ),
  Event(
    title: "Water the plants",
    date: "2023-09-22",
    time: "06:45",
    description: 'Water the plants in the garden',
    isComplete: false,
  ),
  Event(
    title: "Read another Book ",
    date: "2023-09-21",
    time: "05:30",
    description: 'Read one from the Hardy Boys series',
    isComplete: false,
  ),
  Event(
    title: "Meeting with Client",
    date: "2023-09-23",
    time: "10:00",
    description: 'Discuss project requirements with the client',
    isComplete: false,
  ),
  Event(
    title: "Lunch with Friends",
    date: "2023-09-25",
    time: "14:15",
    description: 'Meet friends for lunch at your favorite restaurant',
    isComplete: false,
  ),
  Event(
    title: "Movie Night",
    date: "2023-09-26",
    time: "20:00",
    description: 'Watch a new release movie with popcorn at home',
    isComplete: false,
  ),
  Event(
    title: "Gym Workout",
    date: "2023-09-27",
    time: "09:30",
    description: 'Hit the gym for a morning workout session',
    isComplete: false,
  ),
  Event(
    title: "Team Meeting",
    date: "2023-09-28",
    time: "16:45",
    description: 'Attend the weekly team meeting at the office',
    isComplete: false,
  ),
  Event(
    title: "Dinner Date",
    date: "2023-09-29",
    time: "19:00",
    description: 'Go on a dinner date with your significant other',
    isComplete: false,
  ),
  Event(
    title: "Morning Run",
    date: "2023-10-01",
    time: "08:00",
    description: 'Start your day with a refreshing morning run',
    isComplete: false,
  ),
  Event(
    title: "Project Deadline",
    date: "2023-10-03",
    time: "12:30",
    description: 'Submit the project report before the deadline',
    isComplete: false,
  ),
  Event(
    title: "Family Picnic",
    date: "2023-10-05",
    time: "18:15",
    description: 'Plan a picnic with family at the local park',
    isComplete: false,
  ),
  Event(
    title: "Visit Dentist",
    date: "2023-10-07",
    time: "07:45",
    description: 'Keep your dental appointment for a checkup',
    isComplete: false,
  ),
  Event(
    title: "Shopping Groceries",
    date: "2023-10-10",
    time: "11:30",
    description: 'Shop for groceries and household items',
    isComplete: false,
  ),
  Event(
    title: "Volunteer Work",
    date: "2023-10-12",
    time: "13:00",
    description: 'Participate in a community volunteer event',
    isComplete: false,
  ),
  Event(
    title: "Late-Night Movie",
    date: "2023-10-15",
    time: "21:00",
    description: 'Watch a classic movie before bedtime',
    isComplete: false,
  ),
  Event(
    title: "Read more Books",
    date: "2023-10-18",
    time: "14:30",
    description: 'Read a self-help book to gain new insights',
    isComplete: false,
  ),
  Event(
    title: "Outdoor Adventure",
    date: "2023-10-20",
    time: "16:00",
    description: 'Go hiking or biking in a nearby nature reserve',
    isComplete: false,
  ),
  Event(
    title: "Cooking Class",
    date: "2023-10-22",
    time: "19:30",
    description: 'Attend a cooking class to learn new recipes',
    isComplete: false,
  ),
  Event(
    title: "Gym",
    date: "2023-09-23",
    time: "09:00",
    description: 'Workout at the gym',
    isComplete: false,
  ),
  Event(
    title: "Eat healthy",
    date: "2023-09-23",
    time: "07:30",
    description: 'Cook a healthy breakfast',
    isComplete: false,
  ),
  Event(
      date: "2023-10-06",
      time: "07:00",
      title: "Morning Jog",
      description: 'Go for a refreshing morning jog',
      isComplete: false),
  Event(
      date: "2023-10-06",
      time: "10:45",
      title: "Coffee Break",
      description: 'Take a break and enjoy a cup of coffee',
      isComplete: false),
  Event(
      date: "2023-10-06",
      time: "14:15",
      title: "Workshop",
      description: 'Attend a workshop on a new technology',
      isComplete: false),
  Event(
      date: "2023-10-06",
      time: "16:30",
      title: "Shopping Spree",
      description: 'Shop for your favorite items',
      isComplete: false),
  Event(
      date: "2023-10-06",
      time: "19:30",
      title: "Concert",
      description: 'Attend a live concert of your favorite band',
      isComplete: false),
];
