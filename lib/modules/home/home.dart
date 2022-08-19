import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/news_app/cubit/cubit.dart';
import 'package:newsapp/layouts/news_app/cubit/states.dart';
import 'package:newsapp/modules/web_view/web_view.dart';
import 'package:newsapp/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://www.wendel.com/wp-content/uploads/2020/07/news-on-phone-screen-scaled-1.jpeg",
      'https://images.unsplash.com/photo-1615403916271-e2dbc8cf3bf4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1596741964346-791466b552b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1558266231-44509f897f20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=745&q=80',
      'https://images.unsplash.com/photo-1586449480555-af85fd6ae850?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    ];

    List Channels =[
      {
        'name' : 'BBC News',
        'url':'https://www.bbc.com/news',
        'logo': 'https://yt3.ggpht.com/MRywaef1JLriHf-MUivy7-WAoVAL4sB7VHZXgmprXtmpOlN73I4wBhjjWdkZNFyJNiUP6MHm1w=s900-c-k-c0x00ffffff-no-rj'
      },
      {
        'name' : 'NASA',
        'url':'http://www.nasa.gov/',
        'logo': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/800px-NASA_logo.svg.png'
      },
      {
        'name' : 'beIN Sport',
        'url':'https://www.beinsports.com/',
        'logo': 'https://static-pepper.dealabs.com/threads/raw/default/1634581_1/re/300x300/qt/60/1634581_1.jpg'
      },
      {
        'name' : 'The New York Times',
        'url':'https://www.nytimes.com/international/',
        'logo': 'https://static01.nyt.com/vi-assets/images/share/1200x1200_t.png'
      },

      {
        'name' : 'Al Arabiya',
        'url':'https://english.alarabiya.net/',
        'logo': 'https://images-na.ssl-images-amazon.com/images/I/613SjtpFQ3L.png'
      },
      {
        'name' : 'Euronews',
        'url':'https://www.euronews.com/',
        'logo': 'https://yt3.ggpht.com/ytc/AMLnZu8_OEwrV9mpoWCm5644Etnw2JEWrl64CK0dcAc8Sg=s900-c-k-c0x00ffffff-no-rj'
      },
      {
        'name' : 'Sky News',
        'url':'https://news.sky.com/',
        'logo': 'https://play-lh.googleusercontent.com/pHkMbBQj7MnKj7SYhVMan82alGvqDODnzO_sEeDiM91UfH4_mc05KtcXA4_ujSe-ag'
      },
      {
        'name' : 'CNN',
        'url':'https://edition.cnn.com',
        'logo': 'https://www.logodesignlove.com/wp-content/uploads/2010/06/cnn-logo-white-on-red.jpg'
      },
    ];
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).headlines;
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning,',
                      style: TextStyle(fontSize: 24, letterSpacing: 2),
                    ),
                    Text(
                      'Explore the world by one click',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height / 1.97,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 200),
                    reverse: false,
                    aspectRatio: 5.0,
                  ),
                  itemBuilder: (context, i, id) {
                    //for onTap to redirect to another screen
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //ClipRRect for image border radius
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageList[i],
                            width: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      onTap: () {
                        var url = imageList[i];
                        print(url.toString());
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Headlines',
                  style: TextStyle(
                    letterSpacing: 2,
                    //fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                child: headlinesBuilder(list),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Channels',
                  style: TextStyle(
                    letterSpacing: 2,
                    //fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Channels.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewScreen('${Channels[index]['url']}')));
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15), // Image border
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(33), // Image radius
                              child: Image.network('${Channels[index]['logo']}',
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 4,),
                          Container(
                              width: 70,
                              child: Center(
                                  child: Text('${Channels[index]['name']}',
                                    style: TextStyle(fontSize: 12),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)
                              )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
