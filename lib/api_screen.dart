import 'dart:convert';

import 'package:api_calling_new_practice_app/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({Key? key}) : super(key: key);

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  //ApiModel? aapData;
  List<ApiModel> aapData = [];

  @override
  void initState() {
    getApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Calling Screen"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: aapData == null
                ? const Center(
                    child: SizedBox(),
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                    itemCount: aapData.length,
                    itemBuilder: (context, index) => Container(
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("title : ${aapData[index].title!}"),
                            Text("title : ${aapData[index].userId!}"),
                            Text("title : ${aapData[index].id!}"),

                            //Text("title : ${aapData!.id}"),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  getApi() async {
    var client = http.Client();
    try {
      Response response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );
      if (response.statusCode == 200) {
        aapData = (jsonDecode(response.body) as List?)!.map((dynamic e) => ApiModel.fromJson(e)).toList();

        setState(() {});
      } else {
        debugPrint('........................');
      }
    } finally {
      client.close();
    }
  }
}
