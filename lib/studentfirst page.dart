import 'package:carousel_slider/carousel_slider.dart';
import 'package:education_app/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner:false,
    home: Student_HomePage(),));
}

class Student_HomePage extends StatefulWidget {


  @override
  State<Student_HomePage> createState() => _Student_HomePageState();
}

class _Student_HomePageState extends State<Student_HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blue.shade800,
          floating: true,
          pinned: false,
          leading: IconButton(onPressed: () {  }, icon: Icon(Icons.menu,color: Colors.white,),),
          title: Text("EduTech"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>newUpdates()));

              }, icon: Icon(Icons.notifications,color: Colors.white,)),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                aspectRatio: 16/9,
                enableInfiniteScroll: true,
                viewportFraction: 1.0
              ),

              items: [
                Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://media.istockphoto.com/id/1165486680/photo/education-concept-school-supplies-in-a-shopping-cart-on-the-desk-in-the-auditorium-blackboard.webp?b=1&s=170667a&w=0&k=20&c=AfbJfbUABYtcIgQ191fxs3S1eMc7tBbuC0zabnl2cDQ=")))),

                Container(decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://akm-img-a-in.tosshub.com/indiatoday/images/story/202002/learn-3653430_1920.jpeg?size=690:388")))),
              ],
            ),
          ),
        ),

        SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context,int index){

          List<Color> colors=[
            Colors.amber,Colors.green,Colors.red,
            Colors.blueAccent,Colors.pinkAccent, Colors.purple,
            Colors.grey, Colors.brown
          ];

          List<IconData> icons=[
            CupertinoIcons.book_fill,Icons.co_present,Icons.payment,
            Icons.assignment, Icons.note_alt, Icons.video_library_rounded,
            // Icons.account_box,
            Icons.chat,Icons.question_answer
          ];

          List<String> iconname=[
            "Note","Attendance","Fee",
            "Assignments","Assessments","Tutorials",
            "Guide","Question Bank"
          ];
          

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              color: colors[index % colors.length],
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(icons[index],color: Colors.white,size: 30,),
                  Text(iconname[index],style: TextStyle(color: Colors.white,fontSize: 15,),)
                ],
              ),
            ),
              
          );
          
        },childCount: 8
        ),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,))


      ],
      ),
    );
  }
}
