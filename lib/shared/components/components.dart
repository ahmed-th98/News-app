import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/modules/web_view/web_view.dart';

Widget buildArticalItem(artical, context) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(artical['url'])));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${artical['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${artical['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 14,
                        ),
                        Text(
                            ' ${DateFormat.yMMMMd().format(DateTime.parse(artical['publishedAt']))}',
                            style: TextStyle(color: Colors.grey, fontSize: 13)),
                        Icon(
                          Icons.more_vert,
                          size: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/5,
                          child: Text('${artical['source']['name']}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Color(0xff8561b1),fontSize: 13)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articalBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticalItem(list[index], context),
        separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Color.fromARGB(98, 155, 155, 155)),
            ),
        itemCount: list.length),
    fallback: (context) => isSearch? Container(): Center(child: CircularProgressIndicator()));

Widget headlinesBuilder(list) => ConditionalBuilder(
    condition: list.length > 0,
    builder: (context) => ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebViewScreen(list[index]['url'])));
            },
            child: Container(

              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 3,
                        blurRadius: 9,
                        offset: Offset(0, 3))
                  ]),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(50), // Image radius
                      child: Image.network('${list[index]['urlToImage']}',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 220,
                        child: Text(
                          '${list[index]['title']}',
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 13,
                          ),
                          Text(
                            ' ${DateFormat.yMMMMd().format(DateTime.parse(list[index]['publishedAt']))}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                          Icon(
                            Icons.more_vert,
                            size: 13,
                          ),
                          Container(
                            width: 100,
                            child: Text(
                              '${list[index]['source']['name']}',
                              style: TextStyle(
                                color: Color(0xff8561b1),
                                fontSize: 12.0,
                              ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
    fallback: (context) => Center(child: CircularProgressIndicator()));

void navigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
