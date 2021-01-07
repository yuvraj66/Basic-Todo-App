import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffEA7E75),
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Todo extends StatefulWidget {
  Todo({Key key}) : super(key: key);
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final textController_1 = TextEditingController();
  List todo = [];
  String input;
  bool tick = false;
  @override
  void initState() {
    super.initState();
    todo.add("Demo Task");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      setState(() {
                        tick = true;
                      });
                    },
                    leading: Container(
                      child: Checkbox(
                          focusColor: Theme.of(context).primaryColor,
                          activeColor: Theme.of(context).primaryColor,
                          value: tick,
                          onChanged: (bool value) {
                            setState(() {
                              tick = value;
                            });
                          }),
                    ),
                    title: Text(
                      todo[index].toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete,
                          color: Colors.white.withOpacity(0.5)),
                      onPressed: () {
                        setState(() {
                          todo.removeAt(index);
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Color(0xff12202F),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  backgroundColor: Color(0xff12202F),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Row(
                    children: [
                      Text(
                        "Add Task",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.cancel, color: Colors.white),
                        iconSize: 25,
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                      ),
                    ],
                  ),
                  children: [
                    Container(
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            onChanged: (String value) {
                              input = value;
                            },
                            onSubmitted: (String value) {
                              setState(() {
                                input = value;
                                todo.add(input);
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Eg:Todo a task",
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(.5),
                              ),
                            ),
                          ),
                          Divider(),
                          SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                              color: Color(0xffEA7E75),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                setState(() {
                                  todo.add(input);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("Add"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      backgroundColor: Color(0xff12202F),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Todo Tasks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Todo(),
            ),
          ],
        ),
      ),
    );
  }
}

