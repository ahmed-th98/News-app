import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/news_app/cubit/cubit.dart';
import 'package:newsapp/layouts/news_app/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'News from all over the world',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  onTap: (){
                    setState(() {
                      isShow = false;
                    });
                  },
                  onFieldSubmitted: (value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.purple[200],
                    ),
                  ),
                ),
              ),
              Container(child:isShow? Center(child: Image.asset('assets/se.png')): Expanded(child: articalBuilder(list, context, isSearch: true)))
            ],
          ),
        );
      },
    );
  }
}
