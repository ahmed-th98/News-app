import 'package:flutter/material.dart';

class SettindsScreen extends StatelessWidget {

  List settings =[
    'Account',
    'Security',
    'Notifications',
    'Language',
    'Rate this app',
    'Help & Support'
  ];
  List iconsSetings =[
    Icons.account_circle_outlined,
    Icons.shield_outlined,
    Icons.notifications_none,
    Icons.translate,
    Icons.star_border,
    Icons.question_mark,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical:15, horizontal:20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xff8561b1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Image.asset('assets/s4.png',
                    height: 170,)
              )
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            width: 60,
                            height: 60,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: const Color(0xff8561b1),
                              child:  Icon(
                                iconsSetings[index],
                                size: 30.0,
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Text('${settings[index]}', style: TextStyle( fontSize: 19),),
                        ],
                      ),

                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18.0,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),

              itemCount: settings.length),
        ],
      ),
    );
  }
}
