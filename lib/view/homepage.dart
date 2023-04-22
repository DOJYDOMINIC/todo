import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constant/constant.dart';

import '../control/providerone.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _title = TextEditingController();
  TextEditingController _subtitle = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerone = Provider.of<ProviderOne>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('TodoApp'),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .8,
            child: ListView.builder(
              itemCount: providerone.my_box.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text((index+1).toString(),style: title_text,),
                title: Text(providerone.my_box.getAt(index)['title'],style: title_text,),
                subtitle: Text(providerone.my_box.getAt(index)['subtitle'],style: sub_text),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("Edit"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _title,
                                  decoration: InputDecoration(
                                    hintText: 'Title',
                                  ),
                                ),
                                TextField(
                                  controller: _subtitle,
                                  decoration: InputDecoration(
                                    hintText: 'Subtitle',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  providerone.updateItem(
                                    index,
                                    _title.text,
                                    _subtitle.text,
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text("Save"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);

                                },
                                child: Text("Cancel"),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.edit, color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {
                        providerone.deleteItem(index);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("Create"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _title,
                          decoration: InputDecoration(
                            hintText: 'Title',
                          ),
                        ),
                        TextField(
                          controller: _subtitle,
                          decoration: InputDecoration(
                            hintText: 'Subtitle',
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          providerone.addItem(
                            _title.text,
                            _subtitle.text,
                          );
                          Navigator.pop(context);
                        },
                        child: Text("Create"),
                      ),
                      SizedBox(
                        height: 30,
                        width:100,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text('add'),
            ),
          ),
        ],
      ),
    );
  }
}
