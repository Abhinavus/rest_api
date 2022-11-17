

import 'package:flutter/material.dart';
import 'package:rest_api/services/remote_service.dart';

import '../models/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Post>? posts;
var isLoaded =false;


@override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    posts = await RemoteService().getPosts();
    if(posts!= null){
      setState(() {
        isLoaded =true;
      });
    }

  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Post'),),
  body: Visibility(
    visible: isLoaded,
    // ignore: sort_child_properties_last
    child: ListView.builder(
      itemCount: posts?.length,
      itemBuilder: (context, index) {
      return ListTile(leading: Text(posts![index].title),);
          
      
      


    },),
    replacement: const Center(child: CircularProgressIndicator(),),
  ),
    );
  }
  
  
}