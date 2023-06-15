import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  const Calender({super.key});

  Widget part1() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 48, right: 12),
          child: Text(
            "June",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "2023",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_drop_down),
        )
      ],
    );
  }

  Widget part2() {
    return const Padding(
      padding: EdgeInsets.only(top: 15, left: 48, right: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "M",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          Text(
            "T",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          Text(
            "W",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          Text(
            "TH",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          Text(
            "F",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          Text(
            "S",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
          Text(
            "S",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
          ),
        ],
      ),
    );
  }

  //part4
  Widget part4() {
    return const Padding(
      padding: EdgeInsets.only(top: 10, left: 48, right: 48, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "28",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 15,
            ),
          ),
          Text(
            "29",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
          ),
          Text(
            "30",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
          ),
          Text(
            "31",
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
          ),
          Text(
            "1",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.deepPurple),
          ),
          Text(
            "2",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.deepPurple),
          ),
          Text(
            "3",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }

  Widget upperCalender() {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(15),
      child: Card(
          elevation: 18.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          child: calenderDates()),
    );
  }

  Widget bottomRow(name, profession, time1, time2) {
    return Container(
      child: ListTile(
        leading: Container(
          width: 5,
          color: Colors.pink,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              time1,
              style: const TextStyle(fontSize: 16, color: Colors.pink),
            )
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              profession,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w200),
            ),
            Text(
              time2,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w200),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.only(top: 6),
                  child: upperCalender()),
              Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 8),
                  child: upperCalender()),
              Container(child: upperCalender()),
            ],
          ),
          //1st part

          //2nd part
          Container(
            padding: const EdgeInsets.only(left: 24, top: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Today",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "     __________",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),

          //3rd part

          const Padding(
            padding: EdgeInsets.only(top: 16),
          ),

          bottomRow("Meeting", "Lead - Meeting", "11:00PM", "-02:00"),

          //4th part
          const Padding(
            padding: EdgeInsets.only(top: 16),
          ),

          bottomRow("Design", "Designer - Meeting", "08:00PM", "-03:00"),
        ],
      ),
    );
  }

  Widget calenderDates() {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 60),
      child: Column(
        children: <Widget>[
          //all 8 parts of calender widget

          //1st Part
          part1(),

          //2nd Part
          part2(),

          //3rd Part
          const Divider(
            color: Colors.black12,
            indent: 50,
            endIndent: 50,
          ),

          //4th Part
          part4(),

          //5th Part
          part5(),

          //6th Part
          part6(),

          //7th Part
          part7(),

          //8th Part
          part8(),
        ],
      ),
    );
  }

  Widget part5() {
    return const Padding(
      padding: EdgeInsets.only(top: 10, left: 48, right: 48, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "4",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple,
            ),
          ),
          Text(
            "5",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple,
            ),
          ),
          Text(
            "6",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple,
            ),
          ),
          Text(
            "7",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple,
            ),
          ),
          Text(
            "8",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.deepPurple),
          ),
          Text(
            "9",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.deepPurple),
          ),
          Text(
            "10",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}

Widget part6() {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 48, right: 48, bottom: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          "11",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),

        /*Text(
          "12",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),*/

        Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.pinkAccent,
              ),
              child: const Text(
                "12",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 3,
            )
          ],
        ),
        const Text(
          "13",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        const Text(
          "14",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        const Text(
          "15",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple),
        ),
        const Text(
          "16",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple),
        ),
        const Text(
          "17",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple),
        ),
      ],
    ),
  );
}

Widget part7() {
  return const Padding(
    padding: EdgeInsets.only(top: 10, left: 48, right: 48, bottom: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "18",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "19",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "20",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "21",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "22",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple),
        ),
        Text(
          "23",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple),
        ),
        Text(
          "24",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.deepPurple),
        ),
      ],
    ),
  );
}

Widget part8() {
  return const Padding(
    padding: EdgeInsets.only(top: 10, left: 48, right: 48, bottom: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "25",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "26",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "27",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "28",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.deepPurple,
          ),
        ),
        Text(
          "1",
          style: TextStyle(
              fontWeight: FontWeight.w200, fontSize: 15, color: Colors.black),
        ),
        Text(
          "2",
          style: TextStyle(
              fontWeight: FontWeight.w200, fontSize: 15, color: Colors.black),
        ),
        Text(
          "3",
          style: TextStyle(
              fontWeight: FontWeight.w200, fontSize: 15, color: Colors.black),
        ),
      ],
    ),
  );
}
