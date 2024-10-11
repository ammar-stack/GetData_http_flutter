import 'package:flutter/material.dart';
import 'package:getdata_http/models/get_data_model.dart';
import 'package:getdata_http/services/get_api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<CommentModel> getCommentList = [];
  //getting comments
  getComments() {
    GetApiService().getCommentsModel().then((value) {
      setState(() {
        getCommentList = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: const Text(
          "Fetch Data API",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: getCommentList.length,
        itemBuilder: (context, index) {
          final apiData = getCommentList[index];
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Text(
                          apiData.id.toString(),
                          style: const TextStyle(color: Colors.white,fontSize: 20),
                        )),
                  ],
                ),
                Text('Name: ${apiData.name}',style:const TextStyle(fontSize: 18,),),
                Text('Email:${apiData.email}',style:const TextStyle(fontSize: 18),),
                Text('Body:${apiData.body}',style:const TextStyle(fontSize: 16),)
              ],
            ),
          );
        },
      ),
    );
  }
}
