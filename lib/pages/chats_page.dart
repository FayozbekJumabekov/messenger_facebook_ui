import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../main.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);
  static final String id = "chats_page";

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  bool check = true;
  bool showAdvertising = true;

  List names = [
    "Your story",
    "Joshua",
    "Martin",
    "Karen",
    "Martha",
    "Angela",
    "Samantha"
  ];
  List chatNames = [
    "Leo Messi",
    "Joshua",
    "Martin",
    "Karen",
    "Martha",
    "Angela",
    "Samantha"
  ];
  List chatMessages = [
    "You: What's man!",
    "You: Ok, thanks!",
    "You: See you in Tomorrow",
    "Have a good day",
    "The business plan is awesome!"
  ];
  List timeMessages = ["9:40 AM", "9:25 AM", "Fri", "Sun", "Mon"];
  bool changeTheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        // backgroundColor: (changeTheme)?Color(0xFFFFFF).withOpacity(1) : Color.fromRGBO(17, 17, 17, 0.6),

        /// profile account picture
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/im_story0.jpg"))),
          ),
        ),
        title: Text(
          "Chats",
          style: TextStyle(

              letterSpacing: 0.4,
              fontWeight: FontWeight.w700,
              fontSize: 30),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              MyApp.of(context)?.changeTheme(ThemeMode.dark);
              setState(() {
                changeTheme = false;
              });
            },

            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.04),
                  borderRadius: BorderRadius.circular(100)),
              child: Icon(
                Icons.camera_alt,

              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              MyApp.of(context)?.changeTheme(ThemeMode.light);
             setState(() {
               changeTheme = true;
             });
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 12, top: 12, bottom: 12),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.04),
                  borderRadius: BorderRadius.circular(100)),
              child: Image(
               color: (changeTheme) ? Colors.black : Colors.white,
                width: 25,
                height: 25,
                image: AssetImage("assets/images/newMessage.png"),
              ),
            ),
          ),
        ],
      ),

      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              /// Full body
              SingleChildScrollView(
                child: Column(
                  children: [
                    /// #  Search TextField
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 16),

                      child: Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color: (changeTheme) ? Color.fromRGBO(0, 0, 0, 0.05) : Color.fromRGBO(255, 255, 255, 0.2),
                            borderRadius: BorderRadius.circular(10)),
                        height: 35,
                        child: TextField(
                          cursorColor: Colors.grey.shade700,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 10),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(142, 142, 147, 1),
                                  fontSize: 18,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color.fromRGBO(142, 142, 147, 1),
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                    ),

                    /// # Story line
                    Container(
                      height: 110,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      // color: Color.fromRGBO(255, 255, 255, 1),
                      child: Container(
                        child: ListView.builder(
                            itemCount: 7,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 14),
                                height: 75,
                                width: 65,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    (index == 0)
                                        ? Container(
                                            height: 50,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(

                                              color: (changeTheme) ? Color.fromRGBO(0, 0, 0, 0.05) : Color.fromRGBO(255, 255, 255, 0.2),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Icon(
                                              Icons.add_sharp,
                                              size: 30,
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.bottomRight,
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.04),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/images/im_story${(index)}.jpg"))),
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      90, 212, 57, 1),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 2)),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                          fontSize: 12,

                                          letterSpacing: 0.01,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),

                    /// # Body Chat List Tile
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              height: 80,
                              // color: Color.fromRGBO(255, 255, 255, 1),
                              child: Slidable(
                                key: const ValueKey(0),
                                startActionPane: ActionPane(
                                    motion:  ScrollMotion(),
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(0, 132, 254, 1),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Icon(Icons.camera_alt,color: Colors.white,),
                                            ),

                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: (changeTheme)?Color.fromRGBO(0, 0, 0, 0.04): Color.fromRGBO(255, 255, 255, 0.2),
                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Icon(Icons.phone),
                                            ),
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: (changeTheme)?Color.fromRGBO(0, 0, 0, 0.04): Color.fromRGBO(255, 255, 255, 0.2),

                                                  borderRadius: BorderRadius.circular(50)
                                              ),
                                              child: Icon(Icons.videocam,),
                                            ),

                                          ],
                                        ),
                                      )
                                    ],
                                   ),
                                endActionPane:  ActionPane(
                                  motion: DrawerMotion(),
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: (changeTheme)?Color.fromRGBO(0, 0, 0, 0.04): Color.fromRGBO(255, 255, 255, 0.2),

                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Icon(Icons.menu,),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: (changeTheme)?Color.fromRGBO(0, 0, 0, 0.04): Color.fromRGBO(255, 255, 255, 0.2),

                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Icon(Icons.notifications),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(254, 41, 77, 1),
                                                borderRadius: BorderRadius.circular(50)
                                            ),
                                            child: Icon(Icons.videocam,color: Colors.white,),
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                child: ListTile(
                                  leading: Container(
                                    height: 70,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                "assets/images/im_story${index % 7}.jpg"))),
                                  ),
                                  title: Text(
                                    chatNames[index % 7],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.4,
                                        // color: Color.fromRGBO(0, 0, 0, 1)
                                    ),
                                  ),
                                  subtitle: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 120,
                                          height: 30,
                                          child: Text(
                                            chatMessages[index % 5],
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.15,
                                                color:(changeTheme) ?Color.fromRGBO(
                                                    0, 0, 0, 0.5) : Color.fromRGBO(255, 255, 255, 0.5)

                                            ),
                                          )),
                                      Text("• ${timeMessages[index % 5]}",style: TextStyle(                                                color:(changeTheme) ?Color.fromRGBO(
                                          0, 0, 0, 0.5) : Color.fromRGBO(255, 255, 255, 0.5)
                                      ),)
                                    ],
                                  ),
                                  trailing: Checkbox(
                                    onChanged: (bool? value) {
                                      setState(() {
                                        check = value!;
                                      });
                                    },
                                    value: (index.isEven) ? check : !check,
                                    side: BorderSide(
                                        color: Color.fromRGBO(194, 198, 204, 1),
                                        width: 2),
                                    checkColor: Colors.white,
                                    activeColor:
                                        Color.fromRGBO(194, 198, 204, 1),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ));
                        }),
                  ],
                ),
              ),

              /// show Advertising
              showAdvertising
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showAdvertising = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 65),
                        height: 80,
                        color: (changeTheme)?Color.fromRGBO(255, 255, 255, 1):Colors.black,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: Image(
                            height: 60,
                            width: 60,
                            image: AssetImage("assets/images/adLeading.png"),
                          ),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Pixsellz",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.4),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 15,
                                width: 22,
                                decoration: BoxDecoration(
                                    color: (changeTheme)?Color.fromRGBO(0, 0, 0, 0.2):Color.fromRGBO(255, 255, 255, 0.35),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Ad",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                          subtitle: Container(
                            alignment: Alignment.center,
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Make design easier...",
                                  style: TextStyle(
                                      fontSize: 14,
                                    color: (changeTheme)?Color.fromRGBO(0, 0, 0, 0.5):Color.fromRGBO(255, 255, 255, 0.5),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.14),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "View More",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 132, 254, 1),
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.15),
                                )
                              ],
                            ),
                          ),
                          trailing: Image(
                            height: 60,
                            width: 60,
                            image: AssetImage("assets/images/Rectangle.png"),
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),

              /// # bottom navigation
              GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                height: 70,
                borderRadius: 0,
                blur: 30,
                alignment: Alignment.bottomCenter,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  height: 70,
                  child: Row(
                    children: [
                      Image(
                          color: (changeTheme)?Colors.black:Colors.white,
                          image: AssetImage("assets/images/messageIcon.png")),
                      SizedBox(
                        width: 55,
                      ),
                      Container(
                          height: 35,
                          width: 35,
                          child: Stack(
                            alignment: Alignment(1.7, -1.4),
                            children: [
                              Icon(
                                Icons.people_alt_rounded,
                                size: 35,
                                color: Color.fromRGBO(164, 170, 178, 1),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                        90, 212, 57, 0.1607843137254902),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: (changeTheme)?Colors.white:Colors.transparent, width: 3)),
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      color: Color.fromRGBO(90, 212, 57, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 55,
                      ),
                      Icon(
                        Icons.explore,
                        size: 32,
                        color: (changeTheme)?Color.fromRGBO(164, 170, 178, 1):Color.fromRGBO(103, 110, 117, 1),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
