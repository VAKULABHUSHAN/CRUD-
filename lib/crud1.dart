import 'package:flutter/material.dart';


class lst extends StatefulWidget {
  const lst({super.key});

  @override
  State<lst> createState() => _lstState();
}

class _lstState extends State<lst> {
  TextEditingController abc = TextEditingController();
  TextEditingController hi = TextEditingController();

  final efg =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Card(
            child: TextField(
              controller: abc,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(onPressed: (){
              setState(() {
                efg.add(double.parse(abc.text));
              });
            }, child: Text("ok")),
          ),
          Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ListView.builder(

              itemCount: efg.length, itemBuilder: (BuildContext context, int index)
            {
              return
                Card(
                    color: Colors.teal.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              efg[index].toString(),style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: ()
                            {
                              setState(() {
                                efg.remove(efg[index]);
                              });
                            },
                                icon: Icon(Icons.delete)),
                            IconButton(onPressed: ()
                            {
                              setState(() {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return  AlertDialog(
                                      title: Text("CHANGE VALUE :"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Card(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: hi,
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              efg[index] = double.parse(hi.text);
                                            });
                                            Navigator.of(context).pop();
                                            hi.clear();
                                          },
                                          child: Text("ok",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                            );
                                          },
                                          child: Text("cancel",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              });
                            },
                                icon: Icon(Icons.edit)),
                            // Icon(Icons.edit),
                          ],
                        ),
                      ],
                    )
                );
            },

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: ()
                {
                  setState(() {
                    efg.sort();
                  });
                },
                    child: Text("Sort")),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(onPressed: ()
                {
                  setState(() {
                    efg.sort((b,a) => a.compareTo(b));
                  });
                }, child: Text("reverse")),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed:(){
                  //if(efg.reduce((value, element) => value > element ? value : element))
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      var a=efg.reduce((value, element) => value > element ? value : element);
                      return  AlertDialog(
                        title: Text("MINIMUM VALUE"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "minimum value is: $a",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("maximum"),
              ),
              ElevatedButton(
                onPressed:(){
                  //if(efg.reduce((value, element) => value > element ? value : element))
                  {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        var a=efg.reduce((value, element) => value < element ? value : element);
                        return  AlertDialog(
                          title: Text("MINIMUM VALUE"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "minimum value is: $a",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text("minimum"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        List valuesLessThan5 = efg.where((value) => value < 5).toList();
                        return AlertDialog(
                          title: Text("Values Less Than 5"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Values less than 5: $valuesLessThan5",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Values Less Than 5"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        List valuesGreaterThan5 = efg.where((value) => value > 5).toList();
                        return AlertDialog(
                          title: Text("Values Greater Than 5"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Values greater than 5: $valuesGreaterThan5",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Close"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text("Values Greater Than 5"),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }


}


