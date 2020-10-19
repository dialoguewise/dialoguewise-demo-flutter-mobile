import 'dart:io';

import 'package:dialogue_wise/dialogue_wise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Dialogue Wise'),
      ),
      body: Center(
        child: DialogueWiseList(),
      ),
    ),
  ));
}

class DialogueWiseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: getContents(),
      builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('Please wait its loading...'),
          );
        } else {
          var data = snapshot.data['dialogue'];
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                        child: Image.network(data[index]['dish-photo']),
                        flex: 2),
                    Expanded(
                        child: Column(
                          children: [
                            Text(data[index]['dish-name']),
                            Html(data: data[index]['long-description'])
                          ],
                        ),
                        flex: 4)
                  ],
                );
              });
        }
      },
    );
  }
}

Future<Map> getContents() async {
  var request = new DialogueWiseRequest();
  request.slug = 'my-fab-food-store';
  request.apiKey = '82e2934400364fab877809bd9c40eefa91B93BAD81F7A1FC8FDF2DD1';
  request.emailHash = 'AzLAgRn7emIb+9UUgAmJQewbrk2oLaf5D8KYMG8tHro=';

  var dialogueWiseService = new DialogueWiseService(new HttpClient());
  return await dialogueWiseService.getDialogue(request);
}
