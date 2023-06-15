import 'package:flutter/material.dart';
import 'package:prodeck/calender/calender_view.dart';

class CalenderHome extends StatefulWidget {
  const CalenderHome({Key? key}) : super(key: key);

  @override
  _CalenderHomeState createState() => _CalenderHomeState();
}

class _CalenderHomeState extends State<CalenderHome> {
  Widget nextCard(String time, String title, Color color) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.white12, Colors.white12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 16, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            time,
                            style: const TextStyle(
                              color: Colors.white24,
                              fontSize: 16,
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 320)),
                          CircleAvatar(
                            backgroundColor: color,
                            radius: 7.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Container(
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.pink,
                          backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          ),
                        ),
                      ),
                      Container(
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.orange,
                          backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 15),
                      ),
                      Container(
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 30),
                      ),
                      Container(
                        child: const CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white70,
                          child: Text(
                            "4+",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(left: 45),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Calendar Name
          Flexible(
            flex: 0,
            child: Container(
              child: const Text(
                "Calendar",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Meetings
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Container(
                child: const Text(
                  "You have 4 meetings today",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Flexible(
            flex: 1,
            child: Container(
              child: ListView(
                children: <Widget>[
                  // 1st Card
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalenderView(),
                          ),
                        );
                      },
                      hoverColor: Colors.white70,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [Colors.pink[700]!, Colors.pink[500]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 25,
                            right: 16,
                            top: 40,
                            bottom: 40,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "JUN",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 4)),
                                  Text(
                                    "02",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(left: 30)),
                              Text(
                                "T O D A Y",
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  nextCard("11:00 PM", "Lead Meeting", Colors.pink),
                  nextCard("08:00 PM", "Designer Meeting", Colors.black),
                  nextCard("04:00 PM", "Weekly Scrum", Colors.pink),
                  nextCard("10:00 AM", "Daily Prayers", Colors.black),
                  nextCard("11:00 PM", "Fun Time!", Colors.pink),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
